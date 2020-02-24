clear all;
close all;

allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};
resultGoal = [0 1 1 1 0 0 0 1 0];

for ii=1:length(allPFs)
  result = isPF(allPFs{ii});
  assert(resultGoal(ii)==result);
end