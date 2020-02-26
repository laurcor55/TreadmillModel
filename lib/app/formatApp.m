function app = formatApp(app)
  lightGreen = [0 64 224]./255;
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;

  app.Figure = figure('MenuBar','none','NumberTitle','off','Name','Treadmilling Experiment','Units','pixels','Position',[100, 100, 1500, 900]);
  im = imread('ftszDiagram.png');

  %% Model Panel Component [2000, 2000, 1500, 1500] [20, 250, 460, 460]
  app.ModelPanel = uipanel('Parent',app.Figure,'Title','Configure Kinetics','FontSize',14, 'Units', 'normalized', 'Position', [0.02 0.18 0.47 0.8],'BackgroundColor','w');
  % Model Diagram
  app.ModelDiagramAxes = axes('Parent',app.ModelPanel, 'Units', 'normalized', 'Position', [0, 0, 1, 1]);

  
  imshow(im, 'Parent', app.ModelDiagramAxes);
  set(app.ModelDiagramAxes,'TickLength',[0,0]);

  % Kinetic Constants:
  inputWidth = 0.07;
  height = 0.04;
  vertFontDisplace = 0.02;
  loweroffset = 0.05;
  rightoffset = 0.15;
  
  horFontDisplace = 0;
  
  %%% bottom 

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

  %set(app.ModelPanel, 'Units', 'normalized');
  %% Input Panel Components
  app.InputPanel = uipanel('Parent',app.Figure,'Title','Configure Experiment','FontSize',14,'Position',[0.02 0.02 0.47 0.15],'BackgroundColor','w');
  app.InputAxes = axes('Parent',app.InputPanel,'Units','normalized','Position',[0 0 1 1]);
  set(app.InputAxes,'TickLength',[0,0]);

  inputWidth = 0.07;
  height = height.*5;
  vertFontDisplace = vertFontDisplace.*5;
  tab = 0.32;

  leftAlign = 0.02;
  bottomAlign = 0.7;


  

  leftAlign = 0.65;
  bottomAlign = 0.75;
  tab = 0.2;

  addParameter(app, 'concTotalFtsZ', [0.66, 0.75], 2);
  addParameter(app, 'totalTime', [0.66, 0.5], 1);

  addButton(app, 'runButton', 'Run', [0.66, 0.1], 1, @app.startExperiment);
  
  addButton(app, 'mixingButton', 'PF Mixing Experiment', [0.05 0.4], 2, @app.editMixing);
  addButton(app, 'capButton','Add Bottom Cap', [0.05, 0.7], 2, @app.editCap)
  addButton(app, 'disassemblyButton', 'PF Disassembly Experiment', [0.05, 0.1], 2, @app.editDisassembly)


  %% Ouput Panel Components
  app.OutputPanel = uipanel('Parent',app.Figure,'Title','Experimental Results','FontSize',14,'BackgroundColor','w','Position',[0.51 0.02 0.47 0.96]);
  app.PublishButton = uicontrol('Parent',app.Figure,'String','Export','FontSize',12,'BackgroundColor',lightGreen,'ForegroundColor','w','Units','normalized','Position',[0.52 0.04 0.05 0.04],'Callback',@app.pushPublish);

  bottomAlign = 0.01;
  leftAlign = 0.01;
  width = 0.98;
  height = 0.45;
  app.PlotsTabGroup = uitabgroup('Parent',app.OutputPanel,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  leftAlign = 0.12;
  bottomAlign = 0.15;
  width = 0.85;
  height = 0.82;
  app.MonomerTab = uitab('Parent',app.PlotsTabGroup,'Title','Assembly');
  app.MonomerPlot = axes('Parent',app.MonomerTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.GTPaseTab = uitab('Parent',app.PlotsTabGroup,'Title','GTP Turnover');
  app.GTPasePlot = axes('Parent',app.GTPaseTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.LengthTab = uitab('Parent',app.PlotsTabGroup,'Title','Length');
  app.LengthPlot = axes('Parent', app.LengthTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.SpeedTab = uitab('Parent', app.PlotsTabGroup,'Title','Velocity');
  app.SpeedPlot = axes('Parent', app.SpeedTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.MixingTab = uitab('Parent',app.PlotsTabGroup, 'Title','Subunit Exchange');
  app.MixingPlot = axes('Parent',app.MixingTab,'Units','normalized','Position',[leftAlign bottomAlign width height]);

  app.TableTab = uitab('Parent',app.PlotsTabGroup,'Title','Summary Table');

  leftAlign = 0.12;
  bottomAlign = 0.15;
  width = 0.85;
  height = 0.82;
  properties = {'GTPase';'Critical Concentration';'PF Length';'PF Speed';'PF Mixing Time'};
  T = table(zeros(5,1),'RowNames',properties);
  app.OutputTable = uitable('Parent',app.TableTab,'Data',T{:,:},'ColumnName',{},'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[leftAlign bottomAlign width height]);

  % Movie Stuff
  leftAlign = 0.01;
  bottomAlign = 0.47;
  width = 0.98;
  height = 0.52;
  app.MoviePanel = uipanel('Parent',app.OutputPanel,'Position',[leftAlign bottomAlign width height]);

  leftAlign = 0.12;
  bottomAlign = 0.25;
  width = 0.85;
  height = 0.62;
  app.PFMovie = axes('Parent', app.MoviePanel,'Units','normalized','Position',[leftAlign bottomAlign width height]);
  app.PlayButton = uicontrol('Parent',app.MoviePanel,'Style','pushbutton','String','Play','Units','normalized','Position',[0.5 0.07 0.2 0.1],'Callback',@app.playMovie);
  app.PauseButton = uicontrol('Parent',app.MoviePanel,'Style','pushbutton','String','Pause','Units','normalized','Position',[0.75 0.07 0.2 0.1]);
  app.Pause = 0;
  app.SliderChanged = 0;


end
