function [] = thresholdImg(X)
%read image
A=imread('car_gray.jpg');
% sum along the third dimension
tmp=sum(A,3); 
B = zeros(size(tmp));
% Set all values above the threshold to be one
B(tmp>X) = 1; 
B=logical(B);
figure,imshow(B);
if X == 150
   imwrite(B,'saved_images/car_binary.png')
end