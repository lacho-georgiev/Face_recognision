n_ex = 365;
ex = cell(n_ex, 1);
an = cell(n_ex, 1);

read_labels;
wavelength = 4;
orientation = 7;


for i = 1 : n_ex
    image = imread(['./cropped/FACE_' num2str(i) '.png']);
    matImg = mat2gray(image);
    [mag,phase] = imgaborfilt(matImg,wavelength,orientation);
    ImgVector = mag(:);
    ex{i} = ImgVector;
end

s = size(labels{1});
for i = 1 : s(2)
   an{labels{1}(i)} = [1 0 0 0]';
end

s = size(labels{2});
for i = 1 : s(2)
   an{labels{2}(i)} = [0 1 0 0]';
end

s = size(labels{3});
for i = 1 : s(2)
   an{labels{3}(i)} = [0 0 1 0]';
end

s = size(labels{4});
for i = 1 : s(2)
   an{labels{4}(i)} = [0 0 0 1]';
end
