function plotOutputs(app,hObject,eventdata)  
  

  if length(app.Outputs.time) > 2000
    outputsSave = app.Outputs;
    ind = [1:10:length(app.Outputs.time)];
    app.Outputs.monomerConc = outputsSave.monomerConc(ind);
    app.Outputs.capMonomerConc = outputsSave.capMonomerConc(ind);
    app.Outputs.capDimerConc = outputsSave.capDimerConc(ind);
    app.Outputs.pfFtszConc = outputsSave.pfFtszConc(ind);
    app.Outputs.hydrolysisCount = outputsSave.hydrolysisCount(ind);
    app.Outputs.pfFtszConc = outputsSave.pfFtszConc(ind);
    app.Outputs.time = outputsSave.time(ind);
    app.Outputs.savePfs = {};
    app.Outputs.saveLocations = {};
    ind2 = 1;
    for ii = ind
      app.Outputs.savePfs{ind2} = outputsSave.savePfs{ii};
      app.Outputs.saveLocations{ind2} = outputsSave.saveLocations{ii};
      ind2 = ind2 + 1;
    end
  end
  % Plot kinetics of subunits
  outputData(1) = subunitKinetics(app.Outputs, app.monomerPlot);
  outputDataLabels{1} = 'Critical Concentration';

  % Plot ss hydrolysis rate
  outputData(2) = hydrolysisRate(app.Outputs.hydrolysisCount, app.Outputs.time, app.gtpTurnoverPlot);
  outputDataLabels{2} = 'GTP Turnover';

  % Plot final Pf length
  outputData(3) = pfLengthFinal(app.Outputs.savePfs{end}, app.lengthPlot);
  outputDataLabels{3} = 'PF Length';

  % Plot ss pf treadmill velocity
  outputData(4) = velocitySs(app.Outputs, app.velocityPlot);
  outputDataLabels{4} = 'Treadmill Velocity';

  % Final GDP Proportion
  outputData(5) = 1 - gdpProportion(app.Outputs.savePfs{end});
  outputDataLabels{5} = 'GTP Proportion in PF';

  % If FRET experiment, plot the mixing of pfs
  if app.Parameters.mixPFs == 1
    mixingKineticsPlot(app.Outputs.savePfs, app.Outputs.time, app.mixingPlot);
  end

  % Update output table
  set(app.outputTable, 'Data', outputData');
  set(app.outputTable, 'RowName', outputDataLabels);


  % Plot final pf visualization
  
  finalPfs(app.Outputs.savePfs, app.Outputs.saveLocations, app.pfMovie);
  
  app.pfMatrix = cellsTo3DMatrix(app.Outputs.savePfs, app.Outputs.saveLocations);

  % Set video in app to final Pf
  app.CurrentTick = length(app.Outputs.time);
  delete(app.pfMovieTimeSlider);
  delete(app.pfMovieTimeSliderLabel);
  app.pfMovieTimeSlider = uicontrol(app.moviePanel,'Style','slider','Min',0,'Max', app.Outputs.time(end),'Value', app.Outputs.time(end),'Units','normalized','Position',[0.05 0.1 0.4 0.05],'Callback',@app.pfMovieUpdateTime);
  margins = 0.03;
  app.pfMovieTimeSliderLabel = axes('Parent',app.moviePanel,'xlim',[0 app.Parameters.totalTime],'ylabel',[],'Color','none','Units','normalized','Position',[0.05+margins 0.08 0.4-2.*margins 0.01]);
  xlabel('Time (sec)')

  
end
