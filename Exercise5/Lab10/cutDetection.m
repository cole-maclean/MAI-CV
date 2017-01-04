function [mean_diff,cut] = cutDetection(image,prev_image,neighborhood_avg,threshold)
    img_gray = rgb2gray(image);
    prev_gray = rgb2gray(prev_image);
    hist_diffs = abs(img_gray - prev_gray);
    mean_diff = mean(hist_diffs(:));
    if mean_diff/neighborhood_avg >= threshold
        cut = true;
    else
        cut = false;
    end
end
    