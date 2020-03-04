function disassemblyFormatPopup(app, hObject, eventdata)
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;
  
  answer = inputdlg('Pre-assembly time:', 'PF Disassembly', [1, 20], {num2str(app.Parameters.initialRoundTime)});
  if ~(isempty(answer))
    app.Parameters.initialRoundTime = str2num(answer{1});
    app.Parameters.disassemblePfs = 1;
    set(app.disassemblyButton, 'BackgroundColor', darkGreen , 'String',strcat('PF Disassembly Experiment  ', char(hex2dec('2713'))));
  else
    app.Parameters.disassemblePfs = 0;
    set(app.disassemblyButton, 'BackgroundColor', gray , 'String','PF Disassembly Experiment');

  end
end
