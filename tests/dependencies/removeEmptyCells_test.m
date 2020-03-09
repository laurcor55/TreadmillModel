clear all;
close all;

allPFsBefore = {[0], [2; 3; 1; 1], [2; 1], [1; 1; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5], [0]};
allPFLocationBefore = [1 2 3 4 5 6 7 8 9 10];

allPFsGoal = {[2; 3; 1; 1], [2; 1], [1; 1; 5], [2], [2; 2; 2; 2; 2; 2], [1; 5]};
allPFLocationGoal = [ 2 3 4 7 8 9];

currentTime = 5;
roundTime = 20;
[allPFsAfter, allPFLocationAfter] = removeEmptyCells(allPFsBefore, allPFLocationBefore, currentTime, roundTime);

for ii = 1:length(allPFsAfter)
  assert(allPFLocationAfter(ii) == allPFLocationGoal(ii));
end


for ii=1:length(allPFsGoal)
  assert (length(allPFsAfter{ii})==length(allPFsGoal{ii}));
  for jj=1:length(allPFsGoal{ii})
    assert(allPFsAfter{ii}(jj) == allPFsGoal{ii}(jj));
  end
end

currentTime = 15;
roundTime = 20;
[allPFsAfter, allPFLocationAfter] = removeEmptyCells(allPFsBefore, allPFLocationBefore, currentTime, roundTime);
allPFsGoal = allPFsBefore;
allPFLocationGoal = allPFLocationBefore;

for ii = 1:length(allPFsAfter)
  assert(allPFLocationAfter(ii) == allPFLocationGoal(ii));
end


for ii=1:length(allPFsGoal)
  assert (length(allPFsAfter{ii})==length(allPFsGoal{ii}));

  for jj=1:length(allPFsGoal{ii})
    assert(allPFsAfter{ii}(jj) == allPFsGoal{ii}(jj));
  end
end
