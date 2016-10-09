%% Lab 2-1 Image Edge Detection 
%Comparing Edge Detection Algorithms
%load testing images
color_starbucks = imread('lab2/images_video/starbuck.jpg');
starbucks = rgb2gray(color_starbucks);
dolphin = rgb2gray(imread('lab2/images_video/doulphin.jpg'));
dog = rgb2gray(imread('lab2/images_video/dog.jpg'));
fabulous = rgb2gray(imread('lab2/images_video/fabulous.jpg'));

%edge detect function takes image an using various detection images to view
%possible edges
edge_detect(starbucks);
best_edge = edge(starbucks,'Prewitt',0.1);
%overlap function takes original image, the edges and which color channel
%to use as edge enhancement (1 - R, 2- G, 3 - B)
imshow(overlap_edge(color_starbucks,best_edge,1))
snapnow;
%test best edge detetor parameters on other images
imshow(edge(dolphin,'Prewitt',0.1))
snapnow;
imshow(edge(dog,'Prewitt',0.1))
snapnow;
imshow(edge(fabulous,'Prewitt',0.1))
snapnow;