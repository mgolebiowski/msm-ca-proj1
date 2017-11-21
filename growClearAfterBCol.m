function [ newmap ] = growClearAfterBCol( map, X, Y, emptyPixel )
%GROWCLEARAFTERBCOL Summary of this function goes here
%   Detailed explanation goes here
    for x=2:1:X+1
        for y=2:1:Y+1
            if(map(x,y) >= 1)
                % clear
                map(x,y) = emptyPixel;
            end
        end
    end
    newmap = map;
end

