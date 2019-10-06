% a point pair will only get one type error, systemError or grossError
function [twoErrors, flag, group] = errorsDifferent(pt)
TOTAL_NUM = size(pt, 1);
ERROR_GRIDSIZE = 100;
MAX_SE = 10;
MAX_GE = 10;
twoErrors = zeros(TOTAL_NUM, 2);
flag = zeros(TOTAL_NUM, 1);
group = zeros(TOTAL_NUM, 1);
%SEG means system error grid  
SEG = rand(13, 13, 2) * 2 * MAX_SE - MAX_SE;

%(:,:,1)for direction x & (:,:,2) for Y
%11 - > 13 for boundary
    for k = 1:TOTAL_NUM
        % add gross error
        if rand(1) > 0.8
            twoErrors(k, 1) = rand(1) * 2 * MAX_GE - MAX_GE;
            twoErrors(k, 2) = rand(1) * 2 * MAX_GE - MAX_GE;
            flag(k,1) = 1;
        % add system error
        else
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
            twoErrors(k, 1) = tempErrorX;
            twoErrors(k, 2) = tempErrorY;
            if abs(tempErrorX) < 2
                group(k, 1) = 1;
            elseif abs(tempErrorX) >= 2 && abs(tempErrorX) < 4
                group(k, 1) = 2;
            elseif abs(tempErrorX) >= 4 && abs(tempErrorX) < 6   
                group(k, 1) = 3;
            elseif abs(tempErrorX) >= 6 && abs(tempErrorX) < 8   
                group(k, 1) = 4;
            elseif abs(tempErrorX) >= 8 && abs(tempErrorX) < 10   
                group(k, 1) = 5;
            end
        end
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