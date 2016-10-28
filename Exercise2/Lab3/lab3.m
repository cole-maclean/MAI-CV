%%Key Points at Different Scales
I = vl_impattern('roofs1');
I = single(rgb2gray(I));
imshow(I);
[f,d] = vl_sift(I);

%Filter keypoints at various scales
filtered = f(:,f(3,:) > 1 & f(3,:) < 3);
show_keypoints(I,random_selection(filtered,5)); title('Scale > 1 & < 3');
snapnow;
filtered = f(:,f(3,:) > 3 & f(3,:) < 6); 
show_keypoints(I,random_selection(filtered,5)); title('Scale > 3 & < 6');
snapnow;
filtered = f(:,f(3,:) > 6 & f(3,:) < 9);
show_keypoints(I,random_selection(filtered,5)); title('Scale > 6 & < 9');
snapnow;
filtered = f(:,f(3,:) > 9 & f(3,:) < 12);
show_keypoints(I,random_selection(filtered,5)); title('Scale > 9 & < 12');
snapnow;
filtered = f(:,f(3,:) > 12 & f(3,:) < 15); 
show_keypoints(I,random_selection(filtered,5)); title('Scale > 12 & < 15');
snapnow;
filtered = f(:,f(3,:) > 15 & f(3,:) < 50); 
show_keypoints(I,random_selection(filtered,5)); title('Scale > 15');
snapnow;
%% SIFT Detector Parameters
%Peak Threshold
[f,d] = vl_sift(I,'PeakThresh', 0); 
show_keypoints(I,f); title('PeakThresh = 0');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.01);
show_keypoints(I,f); title('PeakThresh = 0.01');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.03);
show_keypoints(I,f); title('PeakThresh = 0.03');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.05);
show_keypoints(I,f); title('PeakThresh = 0.05');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.06);
show_keypoints(I,f); title('PeakThresh = 0.06');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.07);
show_keypoints(I,f); title('PeakThresh = 0.07');
snapnow;
%% Edge Threshold
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 1);
show_keypoints(I,f); title('EdgeThresh = 1');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 5);
show_keypoints(I,f); title('EdgeThresh = 5');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 10);
show_keypoints(I,f); title('EdgeThresh = 10');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 20);
show_keypoints(I,f); title('EdgeThresh = 20');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 35);
show_keypoints(I,f); title('EdgeThresh = 35');
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 50);
show_keypoints(I,f); title('EdgeThresh = 50');
snapnow;