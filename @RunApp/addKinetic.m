function addKinetic(app, kineticName, location, units)
  if (units==0)
    label = '';
  elseif (units==1)
    label = ' s^-^1';
  elseif (units==2)
    label = ' \muM^-^1s^-^1';
  end

  boxCharacters = 14;
  fullWidth = (length(label)+boxCharacters)*0.006;
  boxProportion = boxCharacters./(length(label) + boxCharacters);

  height = 0.04;
  labelName = strcat(kineticName, 'Input');
  kineticPanel = uipanel('Parent',app.modelPanel, 'BackgroundColor', 'w', 'BorderType', 'none', 'Units', 'normalized', 'Position', [location(1) location(2) fullWidth height]);
  app.(labelName) = uicontrol('Parent', kineticPanel,'Style','edit','String',app.Kinetics.(kineticName),'Units','normalized','Position',[0, 0, boxProportion, 1]);
  labelAxes = axes('Parent', kineticPanel,  'Units', 'normalized', 'Position', [boxProportion, 0.05, 1-boxProportion, 0.95]);
  labelAxes.XAxis.Color = 'w';
  
  text(labelAxes,'String', label,'Interpreter','tex','HorizontalAlignment', 'left','VerticalAlignment', 'bottom','Units','normalized','Position',[0, 0]);

end