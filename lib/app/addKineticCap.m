function addKineticCap(app, kineticName, location, units)
  inputWidth = 0.1;
  height = 0.06;
  labelName = strcat(kineticName, 'Input');
  kineticPanel = uipanel('Parent',app.CapFigure, 'BackgroundColor', 'w', 'BorderType', 'none', 'Units', 'normalized', 'Position', [location(1) location(2) inputWidth height]);
  app.(labelName) = uicontrol('Parent', kineticPanel,'Style','edit','String',app.Kinetics.(kineticName),'Units','normalized','Position',[0, 0, 0.45, 1]);
  labelAxes = axes('Parent', kineticPanel,  'Units', 'normalized', 'Position', [0.45, 0.05, 0.55, 0.95]);
  labelAxes.XAxis.Color = 'w';
  if (units==0)
    label = ' \muM';
  elseif (units==1)
    label = ' s^-^1';
  elseif (units==2)
    label = ' \muM^-^1s^-^1';
  end
  text(labelAxes,'String', label,'Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[0, 0]);

end