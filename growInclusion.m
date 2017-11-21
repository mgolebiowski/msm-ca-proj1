function [ map ] = growInclusion( amount, size, typeIndex, timeIndex, map, sizeX, sizeY, isAfter )
%GROWINCLUSION Summary of this function goes here
%   Detailed explanation goes here
%   timeIndex -> 1->before, 2->after
    if(timeIndex == 1)
        %before
        for i=1:1:amount
            %print one inclusion
            randX = round(rand()*(sizeX-20))+10;
            randY = round(rand()*(sizeY-20))+10;
            while(map(randX,randY) == 0)
                randX = round(rand()*(sizeX-20))+10;
                randY = round(rand()*(sizeY-20))+10;
            end
            map = growInclusionEl(randX, randY, size, typeIndex, map);
        end
    else
        if(isAfter == 1)
            for i=1:1:amount
                count = 0;
                err_count = 0;
                while count == err_count
                    try
                        randX = round(rand()*(sizeX-20))+10;
                        randY = round(rand()*(sizeY-20))+10;
                        while(isOnBorder(map, randX, randY) == 0)
                            randX = round(rand()*(sizeX-20))+10;
                            randY = round(rand()*(sizeY-20))+10;
                        end
                        map = growInclusionEl(randX, randY, size, typeIndex, map);
                    catch myErr
                        err_count = err_count + 1;
                    end
                    count = count + 1;
                end
            end
        end
    end
end

