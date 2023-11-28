function vocab = construct_vocabulary(image_paths, vocab_size)

feature = single([]);

for x = 1:length(image_paths)
    img = imread(image_paths{x,1});
    grayImage = rgb2gray(img);

    %
    %

    points = detectHarrisFeatures(grayImage);
    [features, valid_corners] = extractFeatures(grayImage, points);
    corner_feature=features.Features;

    %
    feature = single(cat(2,feature', corner_feature'));
    feature = feature';
end

%
[idx,centers] = kmeans(feature, vocab_size);
vocab = centers;


