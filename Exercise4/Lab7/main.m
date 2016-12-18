%% MeanShift
img = im2double(imread('images\alwin2.jpg'));
I = reshape(img,size(img,1)*size(img,2),3);
[clustCent,point2cluster,clustMembsCell] = MeanShiftCluster(I',0.1);
for i = 1:length(clustMembsCell)                                             
    I(clustMembsCell{i},:) = repmat(clustCent(:,i)',size(clustMembsCell{i},2),1); 
end
Ims = reshape(I,size(img,1),size(img,2),3);
figure()
subplot(121); imshow(img);    title('Original'); 
subplot(122); imshow(Ims);  title('Mean Shift');