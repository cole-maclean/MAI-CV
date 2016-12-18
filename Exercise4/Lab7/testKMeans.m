
function [imres] = testKMeans(im,k)
    % this is the classical kmeans algorithm
    im1d=reshape(im, size(im,1)*size(im,2),3);
    % Add here the spatial coordinates ….
    idx=kmeans(double(im1d),k);
    im2d=reshape(idx, size(im,1),size(im,2));
    im2d=((double(im2d)-min(min(im2d)))/(max(max(im2d)) - min(min(im2d)))*255.0);
    imres=cat(2,im,cat(3,im2d,im2d,im2d));
end