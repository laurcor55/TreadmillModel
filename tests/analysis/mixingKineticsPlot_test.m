clear all;
close all;


allPFs{1} = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};

allPFs{2}=        {[1], [4; 2; 3; 1; 1; 5], [2; 1; 3], [1; 4; 2; 5], [0],[1],[2], [2; 2; 2; 2; 2; 2], [1; 5],[2; 2; 4; 5]};

time = [.1 5];
f = figure();
ax = axes(f);
pfMixingKinetics = mixingKineticsPlot(allPFs, time, ax);

pfMixingKineticsGoal = [3/12 7/19];
for ii=1:2
  assert(pfMixingKinetics(ii) == pfMixingKineticsGoal(ii));
end
