clear all;
close all;

allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5], [1; 4], [2; 3; 1; 1], [4]};

[gdpBottomInd, gtpBottomInd] = countFtszBottom(allPFs);
gdpBottomIndPredicted = [2, 3, 11];
gtpBottomIndPredicted = [8, 10];

for ii = 1:length(gdpBottomInd)
  assert(gdpBottomInd(ii) == gdpBottomIndPredicted(ii));
end
for ii = 1:length(gtpBottomInd)
  assert(gtpBottomInd(ii) == gtpBottomIndPredicted(ii));
end
