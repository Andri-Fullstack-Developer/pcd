function image_feats = BagsOfVisualWord(image_paths,vocab)

%
sizeofData=length(image_paths);
numofWord=128;
image_feats = zeros(sizeofData,numofWord);

for x = 1:length(image_paths)
    img = imread(image_paths{x,1});
    grayImage = rgb2gray(img);

    %
    %
    points = detectHarrisFeatures(grayImage);
    [features, valid_corners] = extractFeatures(grayImage, points);
    corner_feature=features.Features;

    %
    D = pdist2(single(corner_feature),vocab);
    %
    [~, minIndex] = min(D,[],2);
    %
    clusterHisto = hist(minIndex,128);
    %
    clusterHisto = normr(clusterHisto);
    %
    image_feats(x,:) = clusterHisto;
end