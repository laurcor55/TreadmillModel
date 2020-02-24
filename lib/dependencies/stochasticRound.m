% Stochastically round rate to the nearest whole number. Example - if rate
% is 0.2, you would most likely not have a new dimer; however, 20% of the
% time you would want a new dimer, so you can't just round the 0.2 down to
% 0. We want to include the small chance a dimer will form about every five
% time steps. 


function rate = stochasticRound(rate)
    if rate > 1
        rate = round(rate);
    elseif rate < 0
        rate = 0;
    else
        r = rand;
        if r < rate
            rate = 1;
        else
            rate = 0;
        end
    end

end