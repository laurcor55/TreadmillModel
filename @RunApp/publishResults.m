function publishResults(app,hObject,eventdata)
  createResults(app.Parameters, app.Kinetics, app.Outputs);
  %set(app.Figure, 'Visible', 'off');
  %open('lib/export/output.html');
  fileName = what('lib/export');
  fileName = strcat('file://', fileName.path, '/output.html')
  inputdlg({'Paste the following in your web browser to view export:'}, 'Export Instructions', [1, length(fileName)], {fileName});
  %set(app.Figure, 'Visible', 'on');
end