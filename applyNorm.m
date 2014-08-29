function [pics] = applyNorm(pics, mins, maxs)

width = size(pics, 1);
height = size(pics, 2);

for i=1:width,
    for j=1:height,
        if maxs(i,j)-mins(i,j) == 0,
            pics(width, height, :) = 0;
        else
            pics(width, height, :) = (pics(width, height, :) - mins(i,j))/(maxs(i,j)-mins(i,j));
        end;
    end;
end;

end