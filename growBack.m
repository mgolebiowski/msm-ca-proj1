function [ map ] = growBack( sizeX, sizeY, nucl, map, prop, reserved )
%GROWBACK Summary of this function goes here
%   Detailed explanation goes here
    %borders
    sizeX=sizeX+2;
    sizeY=sizeY+2; 
    emptyPixel = nucl+2;   
    border = sizeX*2+sizeY*2-4;
    for i=2:1:(nucl+length(reserved))
        if max((i+1)==reserved)
            continue;
        end
        randX = round(rand()*(sizeX-1))+1;
        randY = round(rand()*(sizeY-1))+1;
        if(nucl ~= 1)
            while(map(randX,randY) ~= emptyPixel)
                randX = round(rand()*(sizeX-1))+1;
                randY = round(rand()*(sizeY-1))+1;
            end
            map(randX, randY) = i+1;
        else
            map(round(rand()*(sizeX-1))+1,round(rand()*(sizeY-1))+1) = 1;
        end
    end
    imagesc(map,[0,nucl+2]);
    axis off;
    is_done = 0;
    % Lets start the simulation
    while is_done == 0
        newmap = map;
        is_done = 1;
        for x=2:1:(sizeX-1)
            for y=2:1:(sizeY-1)
                % Only change value if pixel is 'empty'
                if(map(x,y) == emptyPixel)     
                    [value, isChanged] = grainRules( x, y, map, emptyPixel, prop, reserved);
                    if(isChanged == 1)
                        newmap(x,y) = value;
                    end
                end
            end
        end
        imagesc(newmap,[0,nucl+2]);
        axis off;
        pause(0.08);
        map = newmap;
        if numel(find(newmap==emptyPixel)) > border
          is_done = 0;
        end
    end
end