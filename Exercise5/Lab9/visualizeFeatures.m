function [] = visualizeFeatures(filter_list)
    load_feats = load('buildings.mat');
    building_feats = load_feats.classFeatures;
    load_feats = load('forest.mat');
    forest_feats = load_feats.classFeatures;
    load_feats = load('sunset.mat');
    sunset_feats = load_feats.classFeatures;
    plot(building_feats(:,filter_list(1)),building_feats(:,filter_list(2)),'bo',...
         forest_feats(:,filter_list(1)),forest_feats(:,filter_list(2)),'go',...
         sunset_feats(:,filter_list(1)),sunset_feats(:,filter_list(2)),'ro');
end
    
    