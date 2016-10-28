%% Panoramic
Ia = imread('images/im2_ex1.jpg');
Ib = imread('images/im1_ex1.jpg');
imshow(rgb2gray(Ia)); title('Left Input Image');
snapnow;
imshow(rgb2gray(Ib)); title('Right Input Image');
snapnow;
Ia = single(rgb2gray(Ia));
Ib = single(rgb2gray(Ib));
M = 1;
[fa,da] = vl_sift(Ia);
[fb,db] = vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da,db);
numMatches = size(matches,2);
xa = fa(1:2,matches(1,:));
xb = fb(1:2,matches(2,:));

max_n = 0;
for i=1:M
    subset = vl_colsubset(1:numMatches, 10);
    d = xb(1:2,subset) - xa(1:2,subset);
    p = mean(d,2);
    xb_ = zeros(size(xb));
    for i=1:numMatches
        xb_(:,i) = xa(:,i) + p;
    end
    n = 0;
    for i=1:numMatches
        e = xb_(:,i) - xb(:,i);
        if (norm(e) < 5), n = n + 1; end
    end
    if (n > max_n)
        best_trans = p;
        max_n = n;
    end
end   

box2 = [1 size(Ia,2) size(Ia,2) 1;
1 1 size(Ia,1) size(Ia,1)];
box2_ = zeros(2,4);
for i=1:4
    box2_(:,i) = box2(:,i) + best_trans;
end
min_x = min(1,min(box2_(1,:)));
min_y = min(1,min(box2_(2,:)));
max_x = max(size(Ib,2),max(box2_(1,:)));
max_y = max(size(Ib,1),max(box2_(2,:)));
ur = min_x:max_x;
vr = min_y:max_y;
[u,v] = meshgrid(ur,vr);
Ib_ = vl_imwbackward(im2double(Ib),u,v);
p_inverse = -best_trans;
u_ = u + p_inverse(1);
v_ = v + p_inverse(2);
Ia_ = vl_imwbackward(im2double(Ia),u_,v_);
Ib_(isnan(Ib_)) = 0;
Ia_(isnan(Ia_)) = 0;
panoramic = max(Ib_, Ia_);
imshow(panoramic,[]); title('Single Iteration Panorama');
snapnow;