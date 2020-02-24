function pfMatrix = plotOutputs(Outputs,Parameters,app)  
  

  
  % Plot kinetics of subunits
  outputData(1) = subunitKinetics(Outputs, app.MonomerPlot);
  outputDataLabels{1} = 'Critical Concentration';

  % Plot ss hydrolysis rate
  outputData(2) = hydrolysisRate(Outputs.hydrolysisCount, Outputs.time, app.GTPasePlot);
  outputDataLabels{2} = 'GTP Turnover';

  % Plot final Pf length
  outputData(3) = pfLengthFinal(Outputs.savePfs{end}, app.LengthPlot);
  outputDataLabels{3} = 'PF Length';

  % Plot ss pf treadmill velocity
  outputData(4) = velocitySs(Outputs, app.SpeedPlot);
  outputDataLabels{4} = 'Treadmill Velocity';

  % Final GDP Proportion
  outputData(5) = gdpProportion(Outputs.savePfs{end});
  outputDataLabels{5} = 'GDP Proportion in PF';

  % If FRET experiment, plot the mixing of pfs
  if Parameters.mixPFs == 1
    mixingKineticsPlot(Outputs.savePfs, Outputs.time, app.MixingPlot);
  end
  outputData

  % Update output table
  set(app.OutputTable, 'Data', outputData');
  set(app.OutputTable, 'RowName', outputDataLabels);


  % Plot final pf visualization
  finalPfs(Outputs.savePfs, Outputs.saveLocations, app.PFMovie);
  pfMatrix = cellsTo3DMatrix(Outputs.savePfs, Outputs.saveLocations);

  % Set video in app to final Pf
  app.CurrentTick = length(Outputs.time);
  delete(app.TimeSlider);
  delete(app.TimeSliderLabel);
  app.TimeSlider = uicontrol(app.MoviePanel,'Style','slider','Min',0,'Max', Outputs.time(end),'Value', app.Outputs.time(end),'Units','normalized','Position',[0.05 0.1 0.4 0.05],'Callback',@app.sliderValueChanged);
  margins = 0.03;
  app.TimeSliderLabel = axes('Parent',app.MoviePanel,'xlim',[0 Parameters.totalTime],'ylabel',[],'Color','none','Units','normalized','Position',[0.05+margins 0.08 0.4-2.*margins 0.01]);
  xlabel('Time (sec)')

  
end
