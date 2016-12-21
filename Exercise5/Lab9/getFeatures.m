function descriptor=getFeatures(img,add_rgb)
%% Read the image for displaying the results
%img=imread(img);

%% Create filters
F=makeLMfilters;

%% Apply convolution
gray=double(rgb2gray(img)); %convert to double grayscale
responses=[]; % clear or create responses
if add_rgb == true
    descriptor=zeros(1,size(F,3)+3); %add 3 for RGB features
else
    descriptor=zeros(1,size(F,3));
end

% Create a loop for each filter
for i=1:size(F,3); 
    responses(:,:,i)=conv2(gray,F(:,:,i),'valid');
    descriptor(i)=mean(mean(abs(responses(:,:,i))));
end
if add_rgb == true
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    descriptor(i+1) = mean(r(:));
    descriptor(i+2) = mean(g(:));
    descriptor(i+3) = mean(b(:));
end
%Plot convolved images

 %figure
 %for k=1:size(F,3);
     %subplot(8,6,k);
     %imagesc(responses(:,:,k)); colorbar;
     
 %end

end