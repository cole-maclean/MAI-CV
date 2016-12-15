function [imagesPath,classArray]=getClassFeatures(directory)
% Get all images in the directory and all its sub-folders
imgSet=imageSet(directory,'recursive');

% Join all image paths into one cell so we can retrace back to them
imagesPath=cell(0);
for c=1:length(imgSet)
    imagesPath=[imagesPath;imgSet(c).ImageLocation'];
end

% % Get class features for the images
classArray=[];
for i=1:length(imagesPath) %for each image
    img=imread(imagesPath{i,1});
    classArray(i,:)=getFeatures(img);
end

end