function [ newmap ] = grainBColoring( map, X, Y)
%GRAINBCOLORING Summary of this function goes here
%   Detailed explanation goes here
    newmap = map;
    for x=3:1:X
        for y=3:1:Y
            if(isOnBorder(map, x, y) == 1)
                % clear
                newmap(x,y) = 0;
            end
        end
    end

end

