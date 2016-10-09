thresholdImg(20)
thresholdImg(30)
thresholdImg(150)
thresholdImg(255)

figure;
L = imread('images/car_gray.jpg');
K = imread('saved_images/car_binary.png');
%multiply the images
Z = immultiply(L,K);
imshow(Z)
figure;

%invert the binary image
K = ~K;
K = 1-K;
K = (K == 0);
imshow(K)
figure;
%multiply the images
I=immultiply(L,K);
imshow(I)
