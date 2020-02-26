function app = addButton(app, buttonName, label, location, style, callback)
  
  lightGreen = [0 64 224]./255;
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;
  if style==1
    height = 0.35;
    width = 0.25;
  elseif style==2
    height = 0.25;
    width = 0.55;
  end
  app.(buttonName) = uicontrol('Parent',app.InputPanel,'Style','pushbutton','String', label,'Units','normalized','Position',[location(1) location(2) width height],'Callback', callback);
  if style==1
    set(app.(buttonName), 'FontSize', 16);
    set(app.(buttonName), 'FontWeight', 'bold');
    set(app.(buttonName), 'BackgroundColor',darkGreen);
    set(app.(buttonName), 'ForegroundColor','k');

  elseif style==2
    set(app.(buttonName), 'FontSize', 12);
    set(app.(buttonName), 'BackgroundColor', gray);
    set(app.(buttonName), 'ForegroundColor','w');

  end

end