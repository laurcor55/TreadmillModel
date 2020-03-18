function app = formatApp(app)
  lightGreen = [0 64 224]./255;
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;

  app.Figure = figure('MenuBar','none','NumberTitle','off','Name','Treadmilling Experiment','Units','pixels','Position',[100, 100, 1500, 900]);
  im = imread('ftszDiagram.png');

  %% Model Panel Component [2000, 2000, 1500, 1500] [20, 250, 460, 460]
  app.modelPanel = uipanel('Parent',app.Figure,'Title','Configure Kinetics','FontSize',14, 'Units', 'normalized', 'Position', [0.02 0.18 0.47 0.8],'BackgroundColor','w');
  % Model Diagram
  modelDiagramAxes = axes('Parent',app.modelPanel, 'Units', 'normalized', 'Position', [0, 0, 1, 1]);
  imshow(im, 'Parent', modelDiagramAxes);
  set(modelDiagramAxes,'TickLength',[0,0]);

  addKinetic(app, 'kbongtp', [0.01, 0.14], 2);
  addKinetic(app, 'kboffgtp', [0.18, 0.08], 1);

  addKinetic(app, 'kbongdp', [0.45, 0.14], 2);
  addKinetic(app, 'kboffgdp', [0.62, 0.08], 1);

  addKinetic(app, 'ktongdp', [0.57, 0.65], 2);
  addKinetic(app, 'ktoffgdp', [0.74, 0.59], 1);

  addKinetic(app, 'ktongtp', [0.15, 0.65], 2);
  addKinetic(app, 'ktoffgtp', [0.32, 0.59], 1);

  addKinetic(app, 'kgdpexchange', [0.18, 0.91], 1);
  addKinetic(app, 'khyd', [0.43, 0.43], 1);
  addKinetic(app, 'knuc', [0.35, 0.91], 0);

  addKinetic(app, 'kanneal', [0.43, 0.5], 4);
  addKinetic(app, 'kfragment', [0.43, 0.55], 3);

  %set(app.modelPanel, 'Units', 'normalized');
  %% Input Panel Components
  app.InputPanel = uipanel('Parent',app.Figure,'Title','Configure Experiment','FontSize',14,'Position',[0.02 0.02 0.47 0.15],'BackgroundColor','w');
  app.InputAxes = axes('Parent',app.InputPanel,'Units','normalized','Position',[0 0 1 1]);
  set(app.InputAxes,'TickLength',[0,0]);


  app.addParameter('concTotalFtsZ', [0.66, 0.75], 2);
  app.addParameter('totalTime', [0.66, 0.5], 1);

  app.addButton('runButton', 'Run', [0.66, 0.1], 1, @app.startExperiment);
  
  app.addButton('mixingButton', 'PF Mixing Experiment', [0.05 0.4], 2, @app.mixingFormatPopup);
  app.addButton('capButton','Add Bottom Cap', [0.05, 0.7], 2, @app.capFormatPopup)
  app.addButton('disassemblyButton', 'PF Disassembly Experiment', [0.05, 0.1], 2, @app.editDisassembly)


  %% Ouput Panel Components
  outputPanel = uipanel('Parent',app.Figure,'Title','Experimental Results','FontSize',14,'BackgroundColor','w','Position',[0.51 0.02 0.47 0.96]);
  app.publishButton = uicontrol('Parent',app.Figure,'String','Export','FontSize',12,'BackgroundColor',lightGreen,'ForegroundColor','w','Units','normalized','Position',[0.52 0.04 0.05 0.04],'Callback',@app.publishResults);

  plotsTabGroup = uitabgroup('Parent',outputPanel,'Units','normalized','Position',[0.01, 0.01, 0.98, 0.45]);
  leftAlign = 0.12;
  bottomAlign = 0.15;
  width = 0.85;
  height = 0.82;
  monomerTab = uitab('Parent',plotsTabGroup,'Title','Assembly');
  app.monomerPlot = axes('Parent',monomerTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  
  gtpTurnoverTab = uitab('Parent',plotsTabGroup,'Title','GTP Turnover');
  app.gtpTurnoverPlot = axes('Parent',gtpTurnoverTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  
  lengthTab = uitab('Parent',plotsTabGroup,'Title','Length');
  app.lengthPlot = axes('Parent', lengthTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  
  velocityTab = uitab('Parent', plotsTabGroup,'Title','Velocity');
  app.velocityPlot = axes('Parent', velocityTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  
  mixingTab = uitab('Parent',plotsTabGroup, 'Title','Subunit Exchange');
  app.mixingPlot = axes('Parent',mixingTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);

  outputTableTab = uitab('Parent',plotsTabGroup,'Title','Summary Table');

  leftAlign = 0.12;
  bottomAlign = 0.15;
  width = 0.85;
  height = 0.82;
  properties = {'GTPase';'Critical Concentration';'PF Length';'PF Speed';'PF Mixing Time'};
  T = table(zeros(5,1),'RowNames',properties);
  app.outputTable = uitable('Parent',outputTableTab,'Data',T{:,:},'ColumnName',{},'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[leftAlign bottomAlign width height]);

  % Movie Stuff
  leftAlign = 0.01;
  bottomAlign = 0.47;
  width = 0.98;
  height = 0.52;
  app.moviePanel = uipanel('Parent',outputPanel,'Position',[leftAlign bottomAlign width height]);

  leftAlign = 0.12;
  bottomAlign = 0.25;
  width = 0.85;
  height = 0.62;
  app.pfMovie = axes('Parent', app.moviePanel,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.pfMoviePlayButton = uicontrol('Parent',app.moviePanel,'Style','pushbutton','String','Play','Units','normalized','Position',[0.5 0.07 0.2 0.1],'Callback',@app.pfMoviePlay);
  app.pfMoviePauseButton = uicontrol('Parent',app.moviePanel,'Style','pushbutton','String','Pause','Units','normalized','Position',[0.75 0.07 0.2 0.1]);
  app.pfMoviePause = 0;
  app.pfMovieSliderValueChange = 0;


end
