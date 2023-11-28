function [train_image_paths, test_image_paths, train_labels, test_labels] = ...
    get_image_paths(data_path, categories, num_train_per_genap)

num_categories = length(categories);
%
train_image_paths = cell(num_categories * num_train_per_genap, 1);
test_image_paths = cell(num_categories * num_train_per_genap, 1);

%
train_labels = cell(num_categories * num_train_per_genap, 1);
test_labels = cell(num_categories * num_train_per_genap, 1);

%
for i=1:num_categories
    images = dir( fullfile(data_path, 'train', categories{i}, '*.jpeg'));
    for j=1:num_train_per_genap
        train_image_paths{(i-1)*num_train_per_genap + j} = fullfile(data_path, 'train', categories{i}, images(j).name);
        train_labels{(i-1)*num_train_per_genap + j} = categories{i};
    end

    images = dir( fullfile(data_path, 'test', categories{i}, '*.jpeg'));

    for j=1:num_train_per_genap
        test_image_paths{(i-1)*num_train_per_genap + j} = fullfile(data_path, 'test', categories{i}, images(j).name);
        test_labels{(i-1)*num_train_per_genap + j} = categories{i};
    end
end


