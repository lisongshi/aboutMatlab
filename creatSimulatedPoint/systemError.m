function [sysError] = systemError(pt)
%sysError(:,1) for X dirction & (:,2) for Y
sysError = zeros(10000,2);
ERROR_GRIDSIZE = 100;
%picture size = 1000 * 1000 
%(:,:,1)for direction x & (:,:,2) for Y
%11 - > 13 for boundary
%SEG means system error grid 
SEG = rand(13, 13, 2) * 5;
    for k = 1:10000
        tempErrorX = 0;
        tempErrorY = 0;
        %calculate error in X direction
        % x0,y0 = 1,2......9£¬10.
        x0 = 2 + floor( pt(k,1)/ERROR_GRIDSIZE );     
        y0 = 2 + floor( pt(k,2)/ERROR_GRIDSIZE );
        %normalize the coordinate of pt.
        normalX = pt(k,1)/ERROR_GRIDSIZE - x0;
        normalY = pt(k,2)/ERROR_GRIDSIZE - y0;
        for i_ = -1:2
            for j_ = -1:2
                tempErrorX = tempErrorX + SEG(x0 + i_, y0 +j_, 1) * S(i_ - normalX) * S(j_ - normalY);
                tempErrorY = tempErrorX + SEG(x0 + i_, y0 +j_, 2) * S(i_ - normalX) * S(j_ - normalY);
            end
        end
        sysError(k, 1) = tempErrorX;
        sysError(k, 2) = tempErrorY;
    end

end

function convS = S(x)
% a is a parameter of ConvFunc
a = -1;
dx = abs(x);
    if dx <= 1
        convS = 1 - ( a + 3) * dx.^2 + ( a + 2) * dx.^3;
    elseif  dx > 1 && dx <= 2
        convS = - 4 * a + 8 * a * dx - 5 * a * dx.^2 + a * dx.^3;
    else 
        convS = 0;
    end     
end