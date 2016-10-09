%% Lab 1-1 Creating images of 3 channels (color images)
%create black and white squares to use in producing box patterns
blackbox = zeros(500,500); 
whitebox = ones(500,500);

%color channels are created by stacking black and whiteboxes in appropriate
%order
channel1 = [blackbox,whitebox;blackbox,whitebox];
channel2 = [blackbox,blackbox;whitebox,whitebox];
channel3 = [whitebox,blackbox;blackbox,blackbox];
%combine channels into 3-D RGB array
color = cat(3, channel1, channel2, channel3);
imshow(color)
imwrite(color,'saved_images/3channels.png')