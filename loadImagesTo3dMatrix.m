function images = loadImagesTo3dMatrix();

pictures = dir('*.png');
images = zeros(94,100,length(pictures));

for i=1:length(pictures),
    pic = imread(pictures(i).name);
    if isequal(size(size(pic)), [1 3]),
        pic = rgb2gray(pic);
    end;
    
    pic = double(pic)/255;
    
    images(:,:,i) = pic;
end;