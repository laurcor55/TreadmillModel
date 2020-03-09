clear all;
close all;


finalPfs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};
gdpProportionActual = gdpProportion(finalPfs);
totalSubunits = 19;
gdpSubunits = 9;
gdpProportionGoal = gdpSubunits./totalSubunits;
assert(abs(gdpProportionActual - gdpProportionGoal) < 0.001)
