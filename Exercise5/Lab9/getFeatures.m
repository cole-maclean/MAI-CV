function descriptor=getFeatures(img)
%% Read the image for displaying the results
%img=imread(img);

%% Create filters
F=makeLMfilters;

%% Apply convolution
gray=double(rgb2gray(img)); %convert to double grayscale
responses=[]; % clear or create responses
descriptor=zeros(1,size(F,3));

% Create a loop for each filter
for i=1:size(F,3); 
    responses(:,:,i)=conv2(gray,F(:,:,i),'valid');
    descriptor(i)=mean(mean(abs(responses(:,:,i))));
end

%Plot convolved images

% figure
% for k=1:size(F,3);
%     subplot(8,6,k);
%     imagesc(responses(:,:,k)); colorbar;
%     
% end

end