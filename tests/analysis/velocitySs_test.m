clear all;
close all;

Outputs.savePfs{15} = {[1], [2; 3; 1; 1; 2; 3], [2; 4; 3; 2; 1; 1], [1; 4; 5; 3; 4; 3; 4], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5]};
Outputs.saveLocations{15} = [6 4 1 6 2 9 13 11 -5];

Outputs.savePfs{20} =        {[1], [2; 3; 1; 1; 4],  [2; 4; 3; 2; 1; 1], [1; 4; 5], [0],[],[2], [2; 2; 2; 2; 2; 2], [1; 5],[2; 2; 4; 5]};
Outputs.saveLocations{20} =       [-1 8 2 3 8 2 9 1 -5 4];

Outputs.time = 1:20;

f = figure();
ax = axes(f);
meanVelocity = velocitySs(Outputs, ax);
velocityGoal = [4 1 -10]./15;
meanVelocityGoal = mean(velocityGoal);

assert(meanVelocity - meanVelocityGoal < 0.01)

close(f);