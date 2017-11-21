function [ map, sizeX, sizeY, nucl ] = growOpen()
%GROWOPEN Summary of this function goes here
%   Detailed explanation goes here
    [FileName,PathName,FilterIndex] = uigetfile({'*.bmp';'*.txt'},'Import a file')
    if(FilterIndex == 1)
        Im = imread([PathName, FileName]);
        imshow(Im);
        sizeX = length(Im(:,1))-2;
        sizeY = length(Im(1,:))-2;
        map = Im;
        nucl = 256;
    else
        f = fopen([PathName, FileName]);
        line = fgetl(f); 
        sizes = str2double(split(line,' '));
        sizeX = sizes(1);
        sizeY = sizes(2);
        map = zeros(sizeX+2, sizeY+2);
        line = fgetl(f);
        while(ischar(line))
            numLine = str2double(split(line,' '));
            x = numLine(1);
            y = numLine(2);
            val = numLine(3);
            map(x+1,y+1) = val;
            line = fgetl(f);
        end
        fclose(f);
        %Num of nucleuses and borders
        nucl = max(max(map))-1;
        map(~map) = nucl+1;
    end
end

