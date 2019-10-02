function [grossError] = grossError(pt)
% now: gE maxmium = 10
%      gER = 0.3
TOTAL_NUM = 3000;
grossError = zeros(TOTAL_NUM,3);
    for k = 1:TOTAL_NUM
        if rand(1) > 0.7
            grossError(k, 1) = rand(1) * 20 - 10;
            grossError(k, 2) = rand(1) * 20 - 10;
            grossError(k, 3) = 1;
        else
            grossError(k, 1) = 0;
            grossError(k, 2) = 0;
        end
        
    end
end