function [ newmap ] = growDualPhase( map, emptyPixel, X, Y, pixelVec )
%GROWSELECTION Summary of this function goes here
%   Detailed explanation goes here
    newmap = map;
    for x=2:1:X+2
        for y=2:1:Y+2
            if(max(map(x,y) == pixelVec) == 1)
                % clear
                newmap(x,y) = 1;
            else
                newmap(x,y) = emptyPixel;
            end
        end
    end
end

