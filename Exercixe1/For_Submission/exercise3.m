function [ output_args ] = exercise3(X)
%smooth performs some tasks to a given image
%resizes, and applys several smoothing filters.
%
% Reads an image
img = imread(X);
RGB = img;
%turn the image into grayscale
try
    img = rgb2gray(RGB);  % we use try in case the image is already grayscale
end    
%set the image size to half
imgh = imresize(img, 0.5);
%reset image to original size
imgre = imresize(imgh, 2);
%display image and histograms 
imhist(img)
title('Original image')
figure;
imshow(img)
title('Original image')
figure;
imhist(imgh)
title('Resized image')
figure;
imshow(imgh)
title('Resized image')
figure;
imhist(imgre)
title('Restored image')
figure;
imshow(imgre)
title('Restored image')

% applying filters

% vertical vector filtering
F1 = imfilter(RGB, [1 1 1 1 1]./5); %filter parameters
imshow(F1)
title('1x5 Smoothing vertrical filter')
figure;
F2 = imfilter(RGB, [1 1 1 1 1 1 1 1 1 1 1 1 1]./13); %filter parameters
imshow(F2)
title('1x13 Smoothing vertrical filter')

% Gaussian filtering of images
img1 = imgaussfilt(RGB,1);
img2 = imgaussfilt(RGB,6);
img3 = imgaussfilt(RGB,9);

%Show smoothed images
figure
imshow(img1)
title('Smoothed image, \sigma = 3')
figure
imshow(img2)
title('Smoothed image, \sigma = 6')
figure
imshow(img3)
title('Smoothed image, \sigma = 9')
figure;
%comparing 3 masks
F1 = imfilter(RGB, [1 1 1 1 1]./5); % we should ./5 to get the desired effect
imshow(F1)
title('Mask [1 1 1 1 1]')
figure;
F2 = imfilter(RGB, [1;1;1;1;1]./5); % we should ./5 to get the desired effect
imshow(F2)
title('Mask [1;1;1;1;1]')
figure;
F31 = imfilter(RGB(:,:,1), [[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1]]./25); % we should ./25 to get the desired effect
F32 = imfilter(RGB(:,:,2), [[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1]]./25); % we should ./25 to get the desired effect
F33 = imfilter(RGB(:,:,3), [[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1];[1 1 1 1 1]]./25); % we should ./25 to get the desired effect
F3 = cat(3, F31, F32, F33);
imshow(F3)
title('Mask Rectangular')
figure;

%show histogram for smoothed and original image
try
    RGB = rgb2gray(RGB);
end
imhist(RGB)
title('Original Image')
figure;
try
    img2 = rgb2gray(img2);
end
imhist(img2)
title('Gausian smoothening')

figure;
Sub = RGB-img2;
imhist(Sub)
whos
end

