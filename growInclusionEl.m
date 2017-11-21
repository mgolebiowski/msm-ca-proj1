function [ map2 ] = growInclusionEl( x, y, size, typeIndex, map1 )
%GROWINCLUSIONEL Summary of this function goes here
%   Detailed explanation goes here
%   typeIndex -> 1->square, 2->circle
    incColor = 0;
    if(typeIndex == 1)
        %square
        if(mod(size,2) == 0)
            startx = x-floor(size/2);
            starty = y-floor(size/2);
            endX = x+ceil(size/2);
            endY = y+ceil(size/2);
            if((x+size-1)>length(map1(:,1)))
                endX = length(map1(:,1));
            end          
            if(((y+size-1)>length(map1(1,:))))
                endY = length(map1(1,:));
            end
           map1(startx:endX,starty:endY) = incColor;
        else
            %00000
            %0xxx0
            %0xxx0
            %0xxx0
            %00000
            half = floor(size/2);
            startX = x-half;
            startY = y-half;
            endX = x+half;
            endY = y+half;
            if(x-half < 1)
                startX = 1;
            end
            if(y-half < 1)
                startY = 1;
            end
            if(x+half > length(map1(:,1)))
                endX = length(map1(:,1));
            end
            if(y+half > length(map1(1,:)))
                endY = length(map1(1,:));
            end
            map1(startX:endX,startY:endY) = incColor;
        end
    else
        %circle
        for i=1:1:size
            if i==1
                map1(x,y) = incColor;
            end
            if i==2
                map1(x-1,y-1) = incColor;
                map1(x+1,y-1) = incColor;
                map1(x-1,y+1) = incColor;
                map1(x+1,y+1) = incColor;
            end
            map1 = midpointCircle(map1,i, x,y, incColor);
        end
    end
    map2=map1;
end

