% takes an image and column # as input and swap the left and right parts
% defined by the swap column
function swap = image_swap(img,split_column)
    left_split = img(:,1:split_column,:);
    right_split = img(:,split_column+1:end,:);
    swap = [right_split,left_split];
end