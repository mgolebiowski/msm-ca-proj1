function [value, isChanged] = grainRules( px, py, map, emptyPixel, propability, reserved)
%GRAINRULES Summary of this function goes here
%   Detailed explanation goes here
    [value, isChanged] = rule1(px,py,map,emptyPixel, reserved);
    if(isChanged == 0)
        [value, isChanged] = rule2(px,py,map,emptyPixel, reserved);
        if(isChanged == 0)
            [value, isChanged] = rule3(px,py,map,emptyPixel, reserved);
            if(isChanged == 0)
                [value, isChanged] = rule4(px,py,map,emptyPixel, propability, reserved);
            end
        end
    end
end

