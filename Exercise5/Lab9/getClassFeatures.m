function [ classFeatures, images ] = getClassFeatures( dirP, extension )
% Get all images in the directory and all its sub-folders
files=dir(fullfile(dirP,strcat('*.',extension)));

images=zeros(size(files,1),1);

% Create LM filters
F=makeLMfilters(); 

classFeatures=zeros(1,size(F,3));
imsize=size(imread(fullfile(dirP, files(1).name)));
images=zeros(size(files,1),imsize(1),imsize(2),imsize(3));

for i=1:size(files,1)
    img=imread(fullfile(dirP, files(i).name));
    images(i,:,:,:)=img;
    classFeatures(i,:)=getFeatures(img);    
end;

%use this for saving the results
%save('sunset.mat', 'classFeatures')

end

