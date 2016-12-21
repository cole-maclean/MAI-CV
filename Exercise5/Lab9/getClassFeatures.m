function [ classFeatures, images,img_files ] = getClassFeatures( dirP, extension,add_rgb)
% Get all images in the directory and all its sub-folders
files=dir(fullfile(dirP,strcat('*.',extension)));
images=zeros(size(files,1),1);

% Create LM filters
F=makeLMfilters();
img_files = cell(size(files,1),1);
if add_rgb == true
    classFeatures=zeros(1,size(F,3)+3);
else
    classFeatures=zeros(1,size(F,3));
end
imsize=size(imread(fullfile(dirP, files(1).name)));
images=zeros(size(files,1),imsize(1),imsize(2),imsize(3));

for i=1:size(files,1)
    img=imread(fullfile(dirP, files(i).name));
    images(i,:,:,:)=img;
    img_files{i} = fullfile(dirP, files(i).name);
    classFeatures(i,:)=getFeatures(img,add_rgb);    
end;

end

