function app = formatCapPopup(app)

  inputWidth = 0.04;
  height = 0.06;
  vertFontDisplace = 0.03;
  horFontDisplace = 0.005;

  app.CapFigure = figure('MenuBar','none','NumberTitle','off','Name','Edit Capping Protein Parameters','Units','normalized','Position',[0.3 0.3 0.5 0.43]);
  capDiagram = imread('capDiagram.png');
  app.CapAxes = axes('Parent',app.CapFigure,'Units','normalized','Position',[0 0 1 1]);
  imshow(capDiagram);

  bottomAlign = 0.1;
  leftAlign = 0.4;
  app.ConcBottomCapInput = uicontrol('Parent',app.CapFigure,'Style','edit','String',app.Parameters.concCap,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.CapAxes,'String','[Cap] (\muM):','Interpreter','tex','Units','normalized','Position',[leftAlign-0.09 bottomAlign+vertFontDisplace]);

  bottomAlign = 0.2;
  leftAlign = 0.07;
  app.capKdInput = uicontrol('Parent',app.CapFigure,'Style','edit','String',app.Kinetics.capKd,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.CapAxes,'String','\muM^-^1','Interpreter','tex','Units','normalized','Position',[leftAlign+inputWidth+horFontDisplace bottomAlign+vertFontDisplace]);

  bottomAlign = 0.3;
  leftAlign = 0.25;
  app.KCapOnPfInput = uicontrol('Parent',app.CapFigure,'Style','edit','String',app.Kinetics.kcaponpf,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.CapAxes,'String','\muM^-^1 s^-^1','Interpreter','tex','Units','normalized','Position',[leftAlign+inputWidth+horFontDisplace bottomAlign+vertFontDisplace]);

  bottomAlign = 0.19;
  leftAlign = 0.27;
  app.KCapOffPfInput = uicontrol('Parent',app.CapFigure,'Style','edit','String',app.Kinetics.kcapoffpf,'Units','normalized','Position',[leftAlign bottomAlign inputWidth height]);
  text(app.CapAxes,'String','s^-^1','Interpreter','tex','Units','normalized','Position',[leftAlign+inputWidth+horFontDisplace bottomAlign+vertFontDisplace]);
  
  colors = protocolormap;
  app.ApplyCapKinetics = uicontrol('Parent',app.CapFigure,'Style','pushbutton','String','Apply','BackgroundColor',colors(6,:),'ForegroundColor','w','Units','normalized','Position',[0.82 0.03 0.15 0.07],'Callback',@app.applyKinetics);

end
