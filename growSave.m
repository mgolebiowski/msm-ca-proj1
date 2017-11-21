function [ fileName ] = growSave( map, axes, nucl )
%GROWSAVE Summary of this function goes here
%   Detailed explanation goes here
    [FileName,PathName,FilterIndex] = uiputfile({'*.bmp';'*.txt'},'Export a file')
    if FilterIndex == 1
        %mapImage = frame2im(getframe(axes));
        %imwrite(mapImage, [PathName, FileName])
        mapImage = mat2gray(map, [1 nucl+1]);
        imwrite(mapImage, [PathName, FileName]);
        %imwrite(map,[0 nucl+1], [PathName, FileName]);
    else
        f = fopen([PathName, FileName], 'wt')
        fprintf(f, '%d %d\n', length(map(:,1))-2, length(map(1,:))-2);  
        for i=2:1:(length(map(:,1)-1))
            for j=2:1:(length(map(1,:)-1))
                fprintf(f, '%d %d %d\n', i-1, j-1, map(i,j));  
            end
        end
        fclose(f);
    end
    fileName = FileName;
end

