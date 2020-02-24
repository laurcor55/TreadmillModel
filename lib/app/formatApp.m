function app = formatApp(app)
  lightGreen = [0 64 224]./255;
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;

  app.Figure = figure('MenuBar','none','NumberTitle','off','Name','Treadmilling Experiment','Units','pixels','Position',[100, 100, 2000, 1500]);
  im = imread('ftszDiagram.png');

  %% Model Panel Component
  app.ModelPanel = uipanel('Parent',app.Figure,'Title','Configure Kinetics','FontSize',14, 'Units', 'pixels', 'Position',[20, 250, 460, 460],'BackgroundColor','w');
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
  leftAlign = 0.05;
  bottomAlign = 0.15;
  app.KbOnGtpInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kbongtp,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','\muM^-^1s^-^1','Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[leftAlign+inputWidth bottomAlign]);

  app.KbOffGtpInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kboffgtp,'Units','normalized','Position',[leftAlign+rightoffset bottomAlign-loweroffset inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','Units','normalized','HorizontalAlignment',  'left','VerticalAlignment', 'bottom','Position',[leftAlign+rightoffset+inputWidth bottomAlign-loweroffset]);


  leftAlign = 0.5;
  bottomAlign = 0.15;
  app.KbOnGdpInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kbongdp,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','\muM^-^1s^-^1','Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[leftAlign+inputWidth bottomAlign]);

  app.KbOffGdpInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kboffgdp,'Units','normalized','Position',[leftAlign+rightoffset bottomAlign-loweroffset inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[leftAlign+rightoffset+inputWidth bottomAlign-loweroffset]);


  leftAlign = 0.6;
  bottomAlign = 0.65;
  app.KtOnInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.ktongdp,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','\muM^-^1s^-^1','Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[leftAlign+inputWidth bottomAlign]);

  app.KtOffInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.ktoffgdp,'Units','normalized','Position',[leftAlign+rightoffset bottomAlign-loweroffset inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','Units','normalized','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Position',[leftAlign+rightoffset+inputWidth bottomAlign-loweroffset]);



  leftAlign = 0.2;
  bottomAlign = 0.65;
  app.KtLowOnInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.ktongtp,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','\muM^-^1s^-^1','Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[leftAlign+inputWidth bottomAlign]);

  app.KtLowOffInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.ktoffgtp,'Units','normalized','Position',[leftAlign+rightoffset bottomAlign-loweroffset inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','Units','normalized','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Position',[leftAlign+rightoffset+inputWidth bottomAlign-loweroffset]);



  leftAlign = 0.35;
  bottomAlign = 0.93;
  app.kswitchInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kswitch,'Units','normalized','Position',[leftAlign bottomAlign inputWidth*2 height]);
  text(app.ModelDiagramAxes,'String','X','Interpreter','tex','Units','normalized','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Position',[leftAlign+inputWidth*2 bottomAlign]);

  leftAlign = 0.2;
  bottomAlign = 0.93;
  app.kgdpexchangeInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.kgdpexchange,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','Units','normalized','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Position',[leftAlign+inputWidth bottomAlign]);


  leftAlign = 0.45;
  bottomAlign = 0.45;
  app.GTPaseInput = uicontrol('Parent',app.ModelPanel,'Style','edit','String',app.Kinetics.indGtpaseRate,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.ModelDiagramAxes,'String','s^-^1','Interpreter','tex','Units','normalized','Position',[leftAlign+inputWidth+horFontDisplace bottomAlign+vertFontDisplace]);

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


  app.MixingButton = uicontrol('Parent',app.InputPanel,'Style','pushbutton','String','PF Mixing Experiment','FontSize',12,'Units','normalized','Position',[0.05 0.4 0.55 0.25],'BackgroundColor',gray,'ForegroundColor','w','Callback',@app.editMixing);
  app.CapButton = uicontrol('Parent',app.InputPanel,'Style','pushbutton','String','Add Bottom Cap','FontSize',12,'Units','normalized','Position',[0.05 0.7 0.55 0.25],'BackgroundColor',gray,'ForegroundColor','w','Callback',@app.editCap);
  app.DisassemblyButton = uicontrol('Parent',app.InputPanel,'Style','pushbutton','String','PF Disassembly Experiment','FontSize',12,'Units','normalized','Position',[0.05 0.1 0.55 0.25],'BackgroundColor',gray,'ForegroundColor','w','Callback',@app.editDisassembly);


  leftAlign = 0.65;
  bottomAlign = 0.75;
  tab = 0.2;
  app.ConcFtsZInput = uicontrol('Parent',app.InputPanel,'Style','edit','String',app.Parameters.concTotalFtsZ,'Units','normalized','Position',[leftAlign+tab bottomAlign inputWidth height]);
  text(app.InputAxes,'String','[FtsZ] (\muM):','Interpreter','tex','Units','normalized','Position',[leftAlign bottomAlign+vertFontDisplace]);


  app.TimeInput = uicontrol('Parent',app.InputPanel,'Style','edit','String',app.Parameters.totalTime,'Units','normalized','Position',[leftAlign+tab bottomAlign-0.25 inputWidth height]);
  text(app.InputAxes,'String','Time (sec)','Interpreter','tex','Units','normalized','Position',[leftAlign bottomAlign-0.25+vertFontDisplace]);


  app.StartButton = uicontrol('Parent',app.InputPanel,'Style','pushbutton','String','Run','FontWeight','bold','FontSize',16,'Units','normalized','Position',[0.65 0.1 0.3 0.35],'BackgroundColor',darkGreen,'ForegroundColor','k','Callback',@app.startExperiment);


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
