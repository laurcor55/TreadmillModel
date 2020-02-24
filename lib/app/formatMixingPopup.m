function app = formatMixingPopup(app)
  feature('DefaultCharacterSet','UTF-8');
  darkGreen = [53 161 19]./255;
  gray = [50 50 50]./255;
  answer = inputdlg('Pre-assembly time:', 'PF Mixing', [1, 20], {'20'});
  if ~(isempty(answer))
    app.Parameters.initialRoundTime = str2num(answer{1});
    app.Parameters.mixPFs = 1;
    set(app.MixingButton, 'BackgroundColor', darkGreen, 'String',strcat('PF Mixing Experiment  ', char(hex2dec('2713'))));
  else
    app.Parameters.mixPFs = 0;
    set(app.MixingButton, 'BackgroundColor', gray, 'String','PF Mixing Experiment');
  end
end
