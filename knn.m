close all;
clear all;
data_path = 'F:\Document\4';

%%
categories = {'A','B','C'};
%%
num_train_per_genap = 3;
%%
[train_image_paths, test_image_paths, train_labels, test_labels] = ...
    get_image_paths(data_path, categories, num_train_per_genap);

%%
vocab_size = 9;
vocab = construct_vocabulary(train_image_paths, vocab_size);

%%
train_image_feats = BagsOfVisualWord(train_image_paths,vocab);
%%
test_image_feats = BagsOfVisualWord(test_image_paths,vocab);

%%
model=fitcknn(train_image_feats, train_labels);

%
label = predict(model,test_image_feats);

%%
accuracy = sum(cellfun(@strcmp, label, test_labels))/numel(test_labels)
