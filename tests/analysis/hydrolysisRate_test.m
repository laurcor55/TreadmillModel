clear all;
close all;

time = [0 2.9 12 15 23];
hydCountOverTime = [4 9 14 23 24];
f = figure();
ax = axes(f);
hydrolysisSs = hydrolysisRate(hydCountOverTime, time, ax);
close(f);


hydrolysisCalculate = (num2conc(24-14))./(23-12).*60;
assert(hydrolysisSs == hydrolysisCalculate);
