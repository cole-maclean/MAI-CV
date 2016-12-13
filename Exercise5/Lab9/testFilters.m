function [ ] = testFilters()
% Illustrates Gaussian filter bank

F=makeLMfilters(); % filter generation
visualizeFilters(F);
end
function [ ] = visualizeFilters(F)
% Visualizes the filters by pseudocolors

figure,
for k=13:13              
    subplot(5,5,k)      
    imagesc(F(:,:,k)); colorbar;
end
end