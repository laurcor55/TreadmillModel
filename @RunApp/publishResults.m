function publishResults(app,hObject,eventdata)
  fileExtension = num2str(floor(rand()*1000));
  createResults(app.Parameters, app.Kinetics, app.Outputs, fileExtension);
  fileName = what('lib/export');
  fileName = strcat('file://', fileName.path, '/data/export', fileExtension, '/output.html')
  inputdlg({'Paste the following in your web browser to view export:'}, 'Export Instructions', [1, length(fileName)], {fileName});
end