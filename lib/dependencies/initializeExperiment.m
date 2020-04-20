function [Subunits, totalRounds, collectSampleStep] = initializeExeperiment(Parameters, Kinetics)
  rng('shuffle'); % Seeds random number generator
  Subunits = subunits(Parameters, Kinetics); % Initializes Subunits. Keeps track of protein states

  if Parameters.mixPFs == 1 || Parameters.disassemblePfs == 1 % If doing a mixing experiment...
    totalRounds = 2; % Have two rounds of model run. First generate PFs and label them with different colors. Second mixes PFs and lets them exchange subunits
  else
    totalRounds = 1; % Just run one, normal round.
  end
  
  collectSampleStep = round(Parameters.totalTime); % Determines how often collect output data.
  
end
