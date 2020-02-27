function app = formatCapPopup(app)

  inputWidth = 0.04;
  height = 0.06;
  vertFontDisplace = 0.03;
  horFontDisplace = 0.005;

  app.CapFigure = figure('MenuBar','none','NumberTitle','off','Name','Edit Capping Protein Parameters','Units','normalized','Position',[0.3 0.3 0.5 0.43]);
  capDiagram = imread('capDiagram.png');
  app.CapAxes = axes('Parent',app.CapFigure,'Units','normalized','Position',[0 0 1 1]);
  imshow(capDiagram);

  addParameterCap(app, 'concCap', [0.05, 0.5], 2);

  addKineticCap(app, 'capKd', [0.23, 0.3], 0)
  addKineticCap(app, 'kcaponpf', [0.35, 0.45], 2);
  addKineticCap(app, 'kcapoffpf', [0.5, 0.35], 1);
  addKineticCap(app, 'kcapoffpfgdp', [0.8, 0.35], 1);

  
  colors = protocolormap;
  uicontrol('Parent',app.CapFigure,'Style','pushbutton','String','Apply','BackgroundColor',colors(6,:),'ForegroundColor','w','Units','normalized','Position',[0.82 0.03 0.15 0.07],'Callback',@app.capApplyKinetics);

end
