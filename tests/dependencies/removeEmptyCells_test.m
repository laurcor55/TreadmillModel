clear all;
close all;

allPFsBefore = {[0], [2; 3; 1; 1], [2; 1], [1; 1; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5], [0]};
allPFLocationBefore = [1 2 3 4 5 6 7 8 9 10];

allPFsGoal = {[2; 3; 1; 1], [2; 1], [1; 1; 5], [2], [2; 2; 2; 2; 2; 2], [1; 5]};
allPFLocationGoal = [ 2 3 4 7 8 9];


[allPFsAfter, allPFLocationGoal] = removeEmptyCells(allPFsBefore, allPFLocationBefore);


for ii=1:length(allPFsGoal)
  assert (length(allPFsAfter{ii})==length(allPFsGoal{ii}));
  for jj=1:length(allPFsGoal{ii})
    assert(allPFsAfter{ii}(jj) == allPFsGoal{ii}(jj));
  end
end
