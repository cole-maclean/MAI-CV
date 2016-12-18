function [ ] = visualizeFilters(F)
    figure, % visualize the filters
    for k=1:size(F,3)
        subplot(8,6,k);
        imagesc(F(:,:,k)); colorbar;
    end
end