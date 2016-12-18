%% LM Filters
%F=makeLMfilters(); % generate the filters
%visualizeFilters(F);
%% Class Features
[classFeatures, bld_images,bld_files] = getClassFeatures('Material Laboratory 9\texturesimages\buildings\','jpg');
save('buildings.mat', 'classFeatures')
[classFeatures, forest_images,forest_files] = getClassFeatures('Material Laboratory 9\texturesimages\forest\','jpg');
save('forest.mat', 'classFeatures')
[classFeatures, sunset_images,sunset_files] = getClassFeatures('Material Laboratory 9\texturesimages\sunset\','jpg');
save('sunset.mat', 'classFeatures')
%% Visualizing Class Feature Spaces
visualizeFeatures([41, 25]);
%% Visualizing 3D Class Feature Spaces
visualizeFeatures3D([25, 38, 41]);
%% KNN Search
k = 9;
all_imgs = vertcat(bld_files,forest_files,sunset_files);
img = imread('Material Laboratory 9\texturesimages\sunset\sunset_1.jpg');
[img_index,distances] = retrieveKImages(img,k);
img_file = imread(char(all_imgs(img_index(1))));
imshow(img_file);
title('Search Image')
%% Close Imgs
for i=2:k
    img_file = imread(char(all_imgs(img_index(i))));
    subplot(1, k, i);
    imshow(img_file);
    title('Closest Images')
end

