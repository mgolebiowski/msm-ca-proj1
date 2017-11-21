function [value, mapChanged] = rule2( x, y, map, emptyPixel, reserved )
%RULE2 Summary of this function goes here
%   Detailed explanation goes here
    newColorVec = [];   
    if(map(x+1,y)~=emptyPixel && map(x+1,y)~=0 && min(map(x+1,y)~=reserved) && map(x+1,y)~=1)
        newColorVec = [newColorVec, map(x+1,y)];
    end
    if(map(x-1,y)~=emptyPixel && map(x-1,y)~=0 && min(map(x-1,y)~=reserved) && map(x-1,y)~=1)
        newColorVec = [newColorVec, map(x-1,y)];
    end
    if(map(x,y+1)~=emptyPixel && map(x,y+1)~=0 && min(map(x,y+1)~=reserved) && map(x,y+1)~=1)
        newColorVec = [newColorVec, map(x,y+1)];
    end
    if(map(x,y-1)~=emptyPixel && map(x,y-1)~=0 && min(map(x,y-1)~=reserved) && map(x,y-1)~=1)
        newColorVec = [newColorVec, map(x,y-1)];
    end
    if(~isempty(newColorVec))
        if(numel(find(newColorVec==mode(newColorVec))) == 3)
            value = mode(newColorVec);
            mapChanged = 1;
        else
            value = emptyPixel;
            mapChanged = 0;
        end
    else
        value = emptyPixel;
        mapChanged = 0;
    end

end

