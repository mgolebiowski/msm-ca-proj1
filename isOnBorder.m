function [ answer ] = isOnBorder( map, x, y )
%ISONBORDER Summary of this function goes here
%   Detailed explanation goes here
    if(map(x,y) ~= 0)
        if(map(x,y) ~= map(x+1,y+1) && map(x+1,y+1) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x+1,y) && map(x+1,y) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x,y+1) && map(x,y+1) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x,y-1) && map(x,y-1) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x-1,y) && map(x-1,y) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x-1,y-1) && map(x-1,y-1) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x+1,y-1) && map(x+1,y-1) ~= 0)
            answer = 1;
        elseif(map(x,y) ~= map(x-1,y+1) && map(x-1,y+1) ~= 0)
            answer = 1;
        else
            answer = 0;
        end
    end
end

