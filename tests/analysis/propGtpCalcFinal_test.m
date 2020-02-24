clear all;
close all;


allPFs = {[1], [2; 3; 1; 1], [2; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5],[2; 2; 4; 5]};

propGtp = propGtpCalcFinal(allPFs);
propGtpGoal = 12/17;

assert(propGtpGoal-propGtp<0.01);