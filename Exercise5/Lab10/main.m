%% Cut Detection
vidIn = VideoReader('materialLab10\Barcelona.mp4');
cuts = zeros(1,vidIn.NumberOfFrames-1);
hist_diffs = zeros(1,vidIn.NumberOfFrames-1);
int_ngh_avg = 0.1;
ngh_length = 7;
for ii = 2:vidIn.NumberOfFrames
  if ii <= ngh_length
      ngh_avg = int_ngh_avg;
  else
      ngh_avg = mean(hist_diffs(ii-ngh_length:ii-1));
  end
  frm = read(vidIn, ii);
  prev_frm = read(vidIn, ii-1);
  [diff,cut] = cutDetection(frm,prev_frm,ngh_avg,10);
  cuts(ii-1) = cut;
  hist_diffs(ii-1) = diff;
end
%% 
bar(hist_diffs)
%% Example Cut
seg = 5;%Change this to view different cut examples
segments = find(cuts);
exmp_cut = segments(seg);
exmp_frm1 = read(vidIn, exmp_cut);
exmp_frm2 = read(vidIn, exmp_cut+1);
figure
subplot(1,2,1);
imshow(exmp_frm1)

subplot(1,2,2);
imshow(exmp_frm2)
%% Backgrounds
vid_frm_size = size(read(vidIn, 1));
frm_seg_lookup = zeros(1,vidIn.NumberOfFrames);
segments = find(cuts);
segments = [1 segments];
backgrounds = zeros(size(find(cuts),2)-1,vid_frm_size(1),vid_frm_size(2));
for k = 2:size(segments,2)
    scene_hists = zeros(segments(k)-segments(k-1),vid_frm_size(1),vid_frm_size(2));
    frm_counter = 1;
    for ii = segments(k-1):segments(k)
        frm_seg_lookup(ii) =  k-1;
        frm = read(vidIn, ii);
        scene_hists(frm_counter,:,:) = rgb2gray(frm);
        frm_counter = frm_counter + 1;
    end
    backgrounds(k-1,:,:) = median(scene_hists,1);
end
%% Example Segmentations
ii = 800;%Change this to view different scenes
frm = rgb2gray(read(vidIn, ii));
frm_background_idx = frm_seg_lookup(ii);
frm_background = squeeze(uint8(backgrounds(frm_background_idx,:,:)));
frm_foreground = frm - frm_background;
figure
subplot(1,3,1);
imshow(frm)

subplot(1,3,2);
imshow(frm_background)

subplot(1,3,3);
imshow(frm_foreground)

%% Make Segmentation Video
vidOut = VideoWriter('segmentation_video');
open(vidOut)
for ii = 1:vidIn.NumberOfFrames
    frm = rgb2gray(read(vidIn, ii));
    writeVideo( vidOut, frm);
    frm_background_idx = frm_seg_lookup(ii);
    frm_background = squeeze(uint8(backgrounds(frm_background_idx,:,:)));
    writeVideo( vidOut, frm_background);
    frm_foreground = frm - frm_background;
    writeVideo( vidOut, frm_foreground);
end
close(vidOut)
%% Outoor/Indoor Segmentation
%Apply cut detection method from above to outdoor/indoor image set
imgs=dir(fullfile('materialLab10\',strcat('*.','jpg')));
[m,n] = size(imgs);
cuts = zeros(1,m);
hist_diffs = zeros(1,m);
int_ngh_avg = 7;
ngh_length = 3;
for ii = 2:m
  if ii <= ngh_length
      ngh_avg = int_ngh_avg;
  else
      ngh_avg = mean(hist_diffs(ii-ngh_length:ii-1));
  end
  frm = imread(fullfile('materialLab10\', imgs(ii).name));
  prev_frm = imread(fullfile('materialLab10\', imgs(ii-1).name));
  [diff,cut] = cutDetection(frm,prev_frm,ngh_avg,4);
  cuts(ii-1) = cut;
  hist_diffs(ii-1) = diff;
end
%% Apply background extraction method from above to outdoor/indoor image set
frm_size = size(imread(fullfile('materialLab10\', imgs(1).name)));
frm_seg_lookup = zeros(1,m);
segments = find(cuts);
segments = [1 segments];
backgrounds = zeros(size(find(cuts),2)-1,frm_size(1),frm_size(2));
for k = 2:size(segments,2)
    scene_hists = zeros(segments(k)-segments(k-1),frm_size(1),frm_size(2));
    frm_counter = 1;
    for ii = segments(k-1):segments(k)
        frm_seg_lookup(ii) =  k-1;
        frm = imread(fullfile('materialLab10\', imgs(ii).name));
        scene_hists(frm_counter,:,:) = rgb2gray(frm);
        frm_counter = frm_counter + 1;
    end
    backgrounds(k-1,:,:) = median(scene_hists,1);
end
%% kMeans outdoor/indoor clustering of segment backgrounds
cluster_indxs = kmeans(backgrounds(:,:),2);
%% Build outdoor/indoor classified examples
figure
%Change these indexes for different examples
start_frm = 73;
end_frm = 82;
fig_count = end_frm-start_frm+1;
counter = 1;
for ii = start_frm:end_frm
    frm = imread(fullfile('materialLab10\', imgs(ii).name));
    frm_background_idx = frm_seg_lookup(ii);
    out_in = cluster_indxs(frm_background_idx);
    imshow(frm);
    hold on
    if out_in == 1
        rectangle('Position',[0 2200 1944 392], 'facecolor','b')
    else
        rectangle('Position',[0 2200 1944 392], 'facecolor','y')
    end
    subplot(1,fig_count,counter);
    counter = counter + 1;
end