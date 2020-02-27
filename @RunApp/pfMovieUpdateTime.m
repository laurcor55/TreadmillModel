function pfMovieUpdateTime(app,hObject,eventdata)
  app.pfMoviePause = 1;
  diffFromRealTime = abs(app.Outputs.time - app.pfMovieTimeSlider.Value);
  [~,indMin] = min(diffFromRealTime);
  app.pfMovieTimeSlider.Value = app.Outputs.time(indMin);
  app.CurrentTick = indMin;

  image(app.pfMovie, app.pfMatrix(:,:,app.CurrentTick));
  colormap(protocolormap);
end