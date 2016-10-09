%% Lab 1-4 Image Split
clooney = imread('lab1/images/clooney.jpg');
%image_swap is a defined function that swaps the left and right image
%parts after the user inputted split column (214 in this case)
imshow(image_swap(clooney,214))
