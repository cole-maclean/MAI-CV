% Computational Vision
% 
% Student name: Cole MacLean and Suren Oganesian
%
% >> OBJECTIVE:
% 1) Write the code for Exercise 3
% 2) Execute the code and check the results
% 3) Comment the experiments and results in a report

% main
function FD_ex3()

% Initialize video reader and player

reader = vision.VideoFileReader('Black_or_White_face_Morphing.mp4');
videoInfo = info(reader);
videoPlayer  = vision.VideoPlayer('Position',[300 300 videoInfo.VideoSize+30]);

% Build a Viola & Jones classifier
model = vision.CascadeObjectDetector;

%Read the video
videoPlayer.release();
cont = ~isDone(reader);
while cont %continue until end of movie or until player is closed
   % Read a frame
   I = step(reader);
   % Detect faces in the frame
   bboxes = step(model, I);
   % Draw a bounding box around the face and annotate
   IFaces = insertObjectAnnotation(I, 'rectangle', bboxes,'Face');
   % Display the frame
   step(videoPlayer,IFaces);    
   cont = ~isDone(reader) && isOpen(videoPlayer);
end
% Clean up
reader.release();
videoPlayer.release();
end
