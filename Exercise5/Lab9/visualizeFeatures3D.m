function [] = visualizeFeatures3D(filter_list)
    load_feats = load('buildings.mat');
    building_feats = load_feats.classFeatures;
    load_feats = load('forest.mat');
    forest_feats = load_feats.classFeatures;
    load_feats = load('sunset.mat');
    sunset_feats = load_feats.classFeatures;
    scatter3(building_feats(:,filter_list(1)),building_feats(:,filter_list(2)),building_feats(:,filter_list(3)),'bo');
    hold on;
    scatter3(forest_feats(:,filter_list(1)),forest_feats(:,filter_list(2)),forest_feats(:,filter_list(3)),'go');
    hold on;
    scatter3(sunset_feats(:,filter_list(1)),sunset_feats(:,filter_list(2)),sunset_feats(:,filter_list(3)),'ro');
end

    
    