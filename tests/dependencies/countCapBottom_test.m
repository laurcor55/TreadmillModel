clear all;
close all;


allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2; 5], [1; 6], [5], [1; 2; 3; 6], [2; 6], [6]};

[gdpCapBottomInd, gtpCapBottomInd] = countCapBottom(allPFs);

gdpCapBottomIndPredicted = [4, 8];
gtpCapBottomIndPredicted = [9, 11, 12];

for ii = 1:length(gdpCapBottomInd)
  assert(gdpCapBottomInd(ii) == gdpCapBottomIndPredicted(ii));
end
for ii = 1:length(gtpCapBottomInd)
  assert(gtpCapBottomInd(ii) == gtpCapBottomIndPredicted(ii));
end