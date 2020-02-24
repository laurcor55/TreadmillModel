clear all;
close all;

allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5], [2; 6], [1; 4; 5]};


[gdpPenultimateInd, gtpPenultimateInd] = countPenultimate(allPFs);
gdpPenultimateIndPredicted = [2, 3, 9];
gtpPenultimateIndPredicted = [4, 8, 10, 11];

for ii = 1:length(gdpPenultimateInd)
  assert(gdpPenultimateInd(ii) == gdpPenultimateIndPredicted(ii));
end
for ii = 1:length(gtpPenultimateInd)
  assert(gtpPenultimateInd(ii) == gtpPenultimateIndPredicted(ii));
end
