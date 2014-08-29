function [genders, ages, faces] = loadFacesData(path);

width = 80;
height = 80;

pictures = dir(fullfile(path, '*.png'));
faces = zeros(width,height,length(pictures));
genders = zeros(1, length(pictures));
ages = zeros(1, length(pictures));

for i=1:length(pictures),
    %disp(pictures(i).name);
    pic = imread(fullfile(path, pictures(i).name));
    pic = imresize(pic, [width height]);
    
    if isequal(size(size(pic)), [1 3]),
        pic = rgb2gray(pic);
    end;
    
    pic = double(pic)/255;
    minI = min(pic(pic ~= 0));
    maxI = max(pic(pic ~= 0));
    pic(pic == 0) = -10;
    pic = (pic - minI)/(maxI-minI);
    pic(pic < 0) = 0;
    
    faces(:,:,i) = pic;
    
    rname = fliplr(pictures(i).name);
    % genders(i) = double(rname(5) == 'm'); % for FGnet
    % ages(i) = str2double(pictures(i).name(5:6)); % for FGNET
    
    genders(i) = double(rname(9) == 'm'); % for Gallagher
    ages(i) = str2double(pictures(i).name(12:13)); % for FGNET
end;