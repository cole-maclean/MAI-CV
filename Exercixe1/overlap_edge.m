function overlap = overlap_edge(img,edges,color_channel)
    % Take the original image, split into color channels and enhance the
    % selected channel by highlighting the edge in that color
    imgR = img(:,:,1);
    imgG = img(:,:,2);
    imgB =img(:,:,3);
    if color_channel == 1
        imgR(edges) = 255;
    elseif color_channel == 2
        imgG(edges) = 255;
    else
        imgB(edges) = 255;
    end
    overlap = cat(3,imgR,imgG,imgB);
end