function pfMatrix = plotOutputs(Outputs,Parameters,app)  
  

  
  % Plot kinetics of subunits
  outputData(1) = subunitKinetics(Outputs, app.monomerPlot);
  outputDataLabels{1} = 'Critical Concentration';

  % Plot ss hydrolysis rate
  outputData(2) = hydrolysisRate(Outputs.hydrolysisCount, Outputs.time, app.gtpTurnoverPlot);
  outputDataLabels{2} = 'GTP Turnover';

  % Plot final Pf length
  outputData(3) = pfLengthFinal(Outputs.savePfs{end}, app.lengthPlot);
  outputDataLabels{3} = 'PF Length';

  % Plot ss pf treadmill velocity
  outputData(4) = velocitySs(Outputs, app.velocityPlot);
  outputDataLabels{4} = 'Treadmill Velocity';

  % Final GDP Proportion
  outputData(5) = gdpProportion(Outputs.savePfs{end});
  outputDataLabels{5} = 'GDP Proportion in PF';

  % If FRET experiment, plot the mixing of pfs
  if Parameters.mixPFs == 1
    mixingKineticsPlot(Outputs.savePfs, Outputs.time, app.mixingPlot);
  end
  outputData

  % Update output table
  set(app.outputTable, 'Data', outputData');
  set(app.outputTable, 'RowName', outputDataLabels);


  % Plot final pf visualization
  finalPfs(Outputs.savePfs, Outputs.saveLocations, app.pfMovie);
  pfMatrix = cellsTo3DMatrix(Outputs.savePfs, Outputs.saveLocations);

  % Set video in app to final Pf
  app.CurrentTick = length(Outputs.time);
  delete(app.pfMovieTimeSlider);
  delete(app.pfMovieTimeSliderLabel);
  app.pfMovieTimeSlider = uicontrol(app.moviePanel,'Style','slider','Min',0,'Max', Outputs.time(end),'Value', app.Outputs.time(end),'Units','normalized','Position',[0.05 0.1 0.4 0.05],'Callback',@app.pfMovieUpdateTime);
  margins = 0.03;
  app.pfMovieTimeSliderLabel = axes('Parent',app.moviePanel,'xlim',[0 Parameters.totalTime],'ylabel',[],'Color','none','Units','normalized','Position',[0.05+margins 0.08 0.4-2.*margins 0.01]);
  xlabel('Time (sec)')

  
end
