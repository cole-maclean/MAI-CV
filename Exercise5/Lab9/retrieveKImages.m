function [IDX,D] = retrieveKImages(img,k)
    img_features = getFeatures(img);
    load_feats = load('buildings.mat');
    building_feats = load_feats.classFeatures;
    load_feats = load('forest.mat');
    forest_feats = load_feats.classFeatures;
    load_feats = load('sunset.mat');
    sunset_feats = load_feats.classFeatures;
    all_data = vertcat(building_feats,forest_feats,sunset_feats);
    [IDX,D] = knnsearch(all_data,img_features,'k',k);
end

    
    