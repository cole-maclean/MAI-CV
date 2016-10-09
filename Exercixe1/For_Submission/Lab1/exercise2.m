% Read the image chairs.jpg
C = imread('images/chairs.jpg');

%Divide the image into 3 images with RGB components
%Red Component
R = C(:,:,1);
%imshow(R(:,:,1))
%figure;

%Green Component
G = C(:,:,2);
%imshow(G(:,:,1))
%figure;

%Blue Component
B = C(:,:,3);
%imshow(B(:,:,1))
%figure;

%Interchanging image channels. 
F(:, :, 1) = C(:, :, 2);
F(:, :, 2) = C(:, :, 1);
F(:, :, 3) = C(:, :, 3);
%imshow(F)

%Multipling one channel by 0
A(:, :, 1) = C(:, :, 1)*0;
A(:, :, 2) = C(:, :, 2);
A(:, :, 3) = C(:, :, 3);
imshow(A)
