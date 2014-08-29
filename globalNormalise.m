function [pics, mins, maxs] = globalNormalise(pics)

width = size(pics, 1);
height = size(pics, 2);
mins = zeros(width, height);
maxs = zeros(width, height);

for i=1:width,
    for j=1:height,
        mins(i,j) = min(pics(i, j, :));
        maxs(i,j) = max(pics(i, j, :));
        if (maxs(i,j) - mins(i,j) == 0),
            pics(i, j, :) = (pics(i, j, :) - mins(i,j));
        else
            pics(i, j, :) = (pics(i, j, :) - mins(i,j))/(maxs(i,j)-mins(i,j));
        end;
    end;
end;

end