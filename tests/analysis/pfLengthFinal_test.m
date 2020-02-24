clear all;
close all;

allPfs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};

f = figure;
ax = axes(f);
meanLength = pfLengthFinal(allPfs, ax);
close(f);
pfLensGoal = [4 3 6];
meanGoal = mean(pfLensGoal);
assert(meanLength==meanGoal);