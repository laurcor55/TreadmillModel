clear all;
close all;

allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [2; 5]};

GTPinPF = countPfGtp(allPFs);
GTPinPFgoal = [0 0 0 1 0 0 0 5 0];

for ii=1:length(GTPinPF)
  assert(GTPinPF(ii)==GTPinPFgoal(ii))
end