%%Key Points at Different Scales
I = vl_impattern('roofs1');
I = single(rgb2gray(I));
imshow(I);
[f,d] = vl_sift(I);

%Filter keypoints at various scales
filtered = f(:,f(3,:) > 1 & f(3,:) < 3);
show_keypoints(I,random_selection(filtered,5));
snapnow;
filtered = f(:,f(3,:) > 3 & f(3,:) < 6);
show_keypoints(I,random_selection(filtered,5));
snapnow;
filtered = f(:,f(3,:) > 6 & f(3,:) < 9);
show_keypoints(I,random_selection(filtered,5));
snapnow;
filtered = f(:,f(3,:) > 9 & f(3,:) < 12);
show_keypoints(I,random_selection(filtered,5));
snapnow;
filtered = f(:,f(3,:) > 12 & f(3,:) < 15);
show_keypoints(I,random_selection(filtered,5));
snapnow;
filtered = f(:,f(3,:) > 15 & f(3,:) < 50);
show_keypoints(I,random_selection(filtered,5));
snapnow;
%% SIFT Detector Parameters
%Peak Threshold
[f,d] = vl_sift(I,'PeakThresh', 0);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.01);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.03);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.07);
show_keypoints(I,f);
snapnow;
%% Edge Threshold
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 1);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 5);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 10);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 25);
show_keypoints(I,f);
snapnow;
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 50);
show_keypoints(I,f);
snapnow;