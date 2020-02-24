clear all;
close all;


allPFs{1} = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};
allPFs{2} = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};
resultGoal = [0 1 1 1 0 0 0 1 1];

for ii=1:length(allPFs{1})
  assert(resultGoal(ii)==isPf(allPFs{1}{ii}));
end