function playMovie(app,hObject,eventdata)
  pauseMovie = 0;
  set(app.pfMoviePauseButton,'Callback',{@pauseMovieNow, pauseMovie});

  [~,~,z] = size(app.pfMatrix);
  app.pfMoviePause = 0;
  if app.CurrentTick == z
      app.CurrentTick = 1;
  end
  colormap(protocolormap);
  while app.CurrentTick < z
    pauseTime = app.Outputs.time(app.CurrentTick+1) - app.Outputs.time(app.CurrentTick);
    if pauseMovie == 1;
      app.pfMoviePause = 1;
    end
    if app.pfMoviePause == 0
      image(app.pfMovie,app.pfMatrix(:,:,app.CurrentTick));
      pause(pauseTime);
      app.pfMovieTimeSlider.Value= app.Outputs.time(1,app.CurrentTick);
      app.CurrentTick = app.CurrentTick +1;
    else
      saveTime = app.CurrentTick;
      app.CurrentTick = z;
      app.pfMoviePause = 1;
    end
  end

  if (app.pfMovieSliderValueChange == 1) || (app.pfMoviePause ==1)
    app.CurrentTick = saveTime;
    app.pfMoviePause = 0;
  end

  function pauseMovieNow(app,hObject,event)
    pauseMovie = 1;
  end
end



