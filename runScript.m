%%

% 
clear all; close all;

addpath('lib', 'lib/analysis', 'lib/data', 'lib/dependencies', 'lib/gillespie', 'lib/export', 'media');

%% Full model can run from this script. User can alter Parameters and Kinetics here.
Parameters = parameters();
Kinetics = kineticsBs();
Outputs = runExperiment(Parameters, Kinetics, false);

createResults(Parameters, Kinetics, Outputs);