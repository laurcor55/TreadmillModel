function capApplyKinetics(app,hObject,eventdata)
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;
  
  app = updateKineticsParameters(app);
  delete(app.CapFigure);
  if app.Parameters.concCap == 0
    msgbox('Warning: [Cap] = 0');
    set(app.capButton, 'BackgroundColor', gray, 'String','Add Bottom Cap');
  else
    set(app.capButton, 'BackgroundColor', darkGreen, 'String',strcat('Add Bottom Cap', char(hex2dec('2713'))));
  end
end