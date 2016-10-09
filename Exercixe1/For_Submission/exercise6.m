%Given 2 images, overlap the first's foreground ontop of the second
hand = imread('lab1/images/hand.jpg');
building = imread('lab1/images/mapfre.jpg');
buildR = building(:,:,1);
buildG = building(:,:,2);
buildB = building(:,:,3);
handR = hand(:,:,1);
handG = hand(:,:,2);
handB = hand(:,:,3);
bin_hand = im2bw(hand,0.1);
bw_pxs = bin_hand == 1;
buildR(bw_pxs) = handR(bw_pxs);
buildG(bw_pxs) = handG(bw_pxs);
buildB(bw_pxs) = handB(bw_pxs);
fuse = cat(3,buildR,buildG,buildB);
imshow(fuse)
imwrite(fuse,'saved_images/hand_mapfre.png')