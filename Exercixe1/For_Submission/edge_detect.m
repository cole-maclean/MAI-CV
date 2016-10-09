function edge_detect(img)
    %trial various edge detection algorithms with varied parameters to
    %optimize edge detection
    imshow(edge(img,'Sobel',0.1))
    snapnow;
    imshow(edge(img,'Sobel',0.5))
    snapnow;
    imshow(edge(img,'Sobel',0.9))
    snapnow;
    imshow(edge(img,'Prewitt',0.1))
    snapnow;
    imshow(edge(img,'Prewitt',0.5))
    snapnow;
    imshow(edge(img,'Prewitt',0.9))
    snapnow;
    imshow(edge(img,'zerocross',0.1))
    snapnow;
    imshow(edge(img,'zerocross',0.5))
    snapnow;
    imshow(edge(img,'zerocross',0.9))
    snapnow;
end