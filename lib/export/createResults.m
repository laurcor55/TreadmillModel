function createResults(Parameters, Kinetics, Outputs, fileExtension)
  f1 = figure;
  len = 3;
  wid = 2;

  monomerSs = subunitKinetics(Outputs, subplot(len, wid,1));
  hydrolysisSs = hydrolysisRate(Outputs.hydrolysisCount, Outputs.time, subplot(len, wid,2));
  meanLength = pfLengthFinal(Outputs.savePfs{end}, subplot(len, wid, 3));

  meanVelocity = velocitySs(Outputs, subplot(len, wid,4));
  finalPfs(Outputs.savePfs, Outputs.saveLocations, subplot(len, wid, 5));
  
  
  if(Parameters.mixPFs>0)
    mixingKineticsPlot(Outputs.savePfs, Outputs.time, subplot(len, wid,6));
  end

  finalPropGtp = propGtpCalcFinal(Outputs.savePfs{end});

end
