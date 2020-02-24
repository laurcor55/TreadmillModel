function [pfLocations, Subunits, Outputs, roundTime] = initializeRound(Parameters,Subunits, Kinetics, allPfs, roundCount)
  
  if roundCount == 1 % Round count is three for third round of PF mixing experiment or regular experiment
    
    Subunits = subunits(Parameters, Kinetics);
  else  %If not mixing PFs together, start with new PFs and subunits.
    
  end

  pfLocations = zeros(1,length(allPfs));

  Outputs = outputs(allPfs, pfLocations, Subunits);

  if (Parameters.mixPFs==1&&roundCount==1)
    roundTime = Parameters.initialRoundTime;
  elseif (Parameters.disassemblePfs==1 && roundCount==1)
    roundTime = Parameters.initialRoundTime;
  else
    roundTime = Parameters.totalTime;
  end
end
