%%

% 
clear all; close all;

addpath('lib', 'lib/analysis', 'lib/data', 'lib/dependencies', 'lib/gillespie', 'lib/export', 'media');

%% Full model can run from this script. User can alter Parameters and Kinetics here.
Parameters = parameters();
Kinetics = kinetics();
profile on
Outputs = runExperiment(Parameters, Kinetics, false);

profile viewer

createResults(Parameters, Kinetics, Outputs);
options = struct('format','pdf', 'showCode', false);
publish('exportResults.m', options);