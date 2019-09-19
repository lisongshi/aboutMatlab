function [grossError] = grossError(pt)
grossError = zeros(10000,3);
    for k = 1:10000
        if rand(1) > 0.8
            grossError(k, 1) = rand(1) * 10;
            grossError(k, 2) = rand(1) * 10;
            grossError(k, 3) = 1;
        else
            grossError(k, 1) = 0;
            grossError(k, 2) = 0;
        end
        
    end
end