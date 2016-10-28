Ia = imread('images/im2_ex1.jpg');
Ib = imread('images/im1_ex1.jpg');
Ia = single(rgb2gray(Ia));
Ib = single(rgb2gray(Ib));
imshow([Ia Ib],[])
[fa, da] = vl_sift(Ia);
[fb, db] = vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da, db);
show_matches(Ia,Ib,fa,fb,matches);
[matches2, scores2] = vl_ubcmatch(da, db, 5);
show_matches(Ia,Ib,fa,fb,matches2);
scores2
%% 
d = fb(1:2,matches(2,:))-fa(1:2,matches(1,:));
p = mean(d,2);
show_matches_linear_model(Ia,Ib,fa,fb,p);
help vl_sift
%% 
d = fb(1:2,matches(2,:))-fa(1:2,matches(1,:));
i = size(d, 2);
A = zeros(6,6);
b = zeros(6,1);
for j = 1:i
x = fa(1:2,matches(1,j));
J = [x(1), x(2), 0, 0, 1, 0; 0, 0, x(1), x(2), 0, 1];
A = A + J'*J;
b = b + J'*d(1:2,j);
end
p = inv(A)*b;
show_matches_affine_model(Ia,Ib,fa,fb,p);
%% 
N = 10;
[Y I] = sort(scores);
matches_sorted = matches(:,I);
show_matches(Ia,Ib,fa,fb,matches_sorted(:,1:N));
%% 
N = 10;
d = fb(1:2,matches_sorted(2,1:N))-fa(1:2,matches_sorted(1,1:N));
p = mean(d,2);
show_matches_linear_model(Ia,Ib,fa,fb,p);
%% 
N = 10;
d = fb(1:2,matches_sorted(2,1:N))-fa(1:2,matches_sorted(1,1:N));
i = size(d, 2);
A = zeros(6,6);
b = zeros(6,1);
for j = 1:i,
x = fa(1:2,matches_sorted(1,j));
J = [x(1), x(2), 0, 0, 1, 0; 0, 0, x(1), x(2), 0, 1];
A = A + J'*J;
b = b + J'*d(1:2,j);
end
p = inv(A)*b;
show_matches_affine_model(Ia,Ib,fa,fb,p);
%% 
Ia = imread('images/im2_ex1.jpg');
Ib = imread('images/im1_ex1.jpg');
Ia = single(rgb2gray(Ia));
Ib = single(rgb2gray(Ib));
[fa,da] = vl_sift(Ia);
[fb,db] = vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da,db);
numMatches = size(matches,2);
xa = fa(1:2,matches(1,:));
xb = fb(1:2,matches(2,:));
subset = vl_colsubset(1:numMatches, 10);
d = xb(1:2,subset) - xa(1:2,subset);
p = mean(d,2);
xb_ = zeros(size(xb));
for i=1:numMatches,
xb_(:,i) = xa(:,i) + p;
end
n = 0;
for i=1:numMatches,
e = xb_(:,i) - xb(:,i);
if (norm(e) < 5), n = n + 1; end
end
box2 = [1 size(Ia,2) size(Ia,2) 1;
1 1 size(Ia,1) size(Ia,1)];
box2_ = zeros(2,4);
for i=1:4,
box2_(:,i) = box2(:,i) + p;
end
min_x = min(1,min(box2_(1,:)));
min_y = min(1,min(box2_(2,:)));
max_x = max(size(Ib,2),max(box2_(1,:)));
max_y = max(size(Ib,1),max(box2_(2,:)));
ur = min_x:max_x;
vr = min_y:max_y;
[u,v] = meshgrid(ur,vr);
Ib_ = vl_imwbackward(im2double(Ib),u,v);
p_inverse = -p;
u_ = u + p_inverse(1);
v_ = v + p_inverse(2);
Ia_ = vl_imwbackward(im2double(Ia),u_,v_);
Ib_(isnan(Ib_)) = 0;
Ia_(isnan(Ia_)) = 0;
panoramic = max(Ib_, Ia_);
imshow(panoramic,[]);