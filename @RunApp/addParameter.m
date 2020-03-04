function addParameter(app, parameterName, location, units)
  inputWidth = 0.25;
  height = 0.25;
  labelName = strcat(parameterName, 'Input');
  parameterPanel = uipanel('Parent',app.InputPanel, 'BackgroundColor', 'w', 'BorderType', 'none', 'Units', 'normalized', 'Position', [location(1) location(2) inputWidth height]);
  app.(labelName) = uicontrol('Parent', parameterPanel,'Style','edit','String',app.Parameters.(parameterName),'Units','normalized','Position',[0.5, 0, 0.5, 1]);
  labelAxes = axes('Parent', parameterPanel,  'Units', 'normalized', 'Position', [0, 0.05, 0.45, 0.95]);
  labelAxes.XAxis.Color = 'w';
  labelAxes.YAxis.Color = 'w';

  if (units==0)
    label = ' ';
  elseif (units==1)
    label = 'Time (s):';
  elseif (units==2)
    label = 'FtsZ (\muM): ';
  end
  text(labelAxes,'String', label,'Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[0, 0]);

end