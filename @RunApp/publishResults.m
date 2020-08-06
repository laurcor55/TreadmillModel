function publishResults(app,hObject,eventdata)
  createResults2(app.Parameters, app.Kinetics, app.Outputs, app.outputTable);
  publish('publishResults2.m', 'pdf');
end