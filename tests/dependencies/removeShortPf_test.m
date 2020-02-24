clear all;
close all;

Subunits.capDimerNum = 10;
Subunits.capMonomerNum = 10;
Subunits.gdpMonomerNum = 10;
Subunits.monomerNum = 10;
Subunits.highMonomerNum = 10;
gdpOffCount = 5;

allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5], [5], [2]};
allPFsGoal = {[0], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[0],[0], [2; 2; 2; 2; 2; 2], [1; 5], [0], [0]};

for ii=1:length(allPFs)
  pf = allPFs{ii};
  pfGoal = allPFsGoal{ii};
  [pf, Subunits, gdpOffCount] = removeShortPf(pf, Subunits, gdpOffCount);
  for jj=1:length(pf)
    assert(pf(jj)==pfGoal(jj));
  end
end
assert(Subunits.capDimerNum == 10);
assert(Subunits.capMonomerNum == 11);
assert(Subunits.gdpMonomerNum == 10);
assert(Subunits.monomerNum == 13);
assert(Subunits.highMonomerNum == 10);
assert(gdpOffCount == 7);