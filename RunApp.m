classdef RunApp < handle
    properties
        Figure;

        Kinetics;
        Parameters;
        Outputs;

        ModelPanel;
        ModelDiagramAxes;

        kbongtpInput;
        kboffgtpInput;
        kbongdpInput;
        kboffgdpInput;

        ktongdpInput;
        ktoffgdpInput;
        ktongtpInput;
        ktoffgtpInput;
        
        knucInput;
        kgdpexchangeInput;
        khydInput;
        MixingButton;
        DisassemblyButton;

        CapFigure;
        CapAxes;
        CapDiagram;
        capKdInput;
        KCapOffInput;
        KCapOnPfInput;
        KCapOffPfInput;
        ApplyCapKinetics;

        InputPanel;
        InputAxes;
        ConcFtsZInput;
        ConcBottomCapInput;
        CapButton;
        TimeInput;
        StartButton;
        SavePFs;

        OutputPanel;
        PlotsTabGroup;
        MonomerTab;
        MonomerPlot;
        GTPaseTab;
        GTPasePlot;
        SpeedTab;
        SpeedPlot;
        LengthTab;
        LengthPlot;
        TableTab;
        MixingTab;
        MixingPlot;
        PrintoutTable;

        MoviePanel;
        PFMovie;
        PlayButton;
        PauseButton;
        Pause;
        TimeSlider;
        TimeSliderLabel;
        CurrentTick;
        SliderChanged;
        Data;
        OutputTable;
        PublishButton;

        GTPaseFig;
        pfMatrix
    end

    methods
        function app = RunApp;
          addpath('lib', 'lib/analysis', 'lib/app','lib/data', 'lib/dependencies', 'lib/gillespie', 'lib/export', 'media')
          addpath('media')

          app.Parameters = parameters();
          app.Kinetics = kineticsBs();

          app = formatApp(app);
        end

        function editCap(app,hObject,eventdata)
          app = formatCapPopup(app);
        end

        function editMixing(app,hObject,eventdata)
          app = formatMixingPopup(app);
        end

        function editDisassembly(app,hObject,eventdata)
          app = formatDisassemblyPopup(app);
        end

        function applyKinetics(app,hObject,eventdata)
          darkGreen = [53 161 19]./255;
          gray = [50 50 50]./255;
          app.Kinetics.capKd = str2double(app.capKdInput.String);
          app.Kinetics.kcaponpf = str2double(app.KCapOnPfInput.String);
          app.Kinetics.kcapoffpf = str2double(app.KCapOffPfInput.String);
          app.Parameters.concCap = str2double(app.ConcBottomCapInput.String);

          delete(app.CapFigure);
          if app.Parameters.concCap == 0
            msgbox('Warning: [Cap] = 0');
            set(app.CapButton, 'BackgroundColor', gray, 'String','Add Bottom Cap');
          else
            set(app.CapButton, 'BackgroundColor', darkGreen, 'String',strcat('Add Bottom Cap', char(hex2dec('2713'))));
          end
        end

        function startExperiment(app,hObject,eventdata)
          app = updateKineticsParameters(app); % apply user's parameters
          app.Outputs = runExperiment(app.Parameters, app.Kinetics, true);
          outputType = 1;
          app.pfMatrix = plotOutputs(app.Outputs, app.Parameters, app);
        end

        function playMovie(app,hObject,eventdata)
          Pause = 0;
          set(app.PauseButton,'Callback',{@pauseMovie,Pause});

          [~,~,z] = size(app.pfMatrix);
          app.Pause = 0;
          if app.CurrentTick == z
              app.CurrentTick = 1;
          end
          colormap(protocolormap);
          while app.CurrentTick < z
            pauseTime = app.Outputs.time(app.CurrentTick+1) - app.Outputs.time(app.CurrentTick);
            if Pause == 1;
              app.Pause = 1;
            end
            if app.Pause == 0
              image(app.PFMovie,app.pfMatrix(:,:,app.CurrentTick));
              pause(pauseTime);
              app.TimeSlider.Value= app.Outputs.time(1,app.CurrentTick);
              app.CurrentTick = app.CurrentTick +1;
            else
              saveTime = app.CurrentTick;
              app.CurrentTick = z;
              app.Pause = 1;
            end
          end

          if (app.SliderChanged == 1) || (app.Pause ==1)
            app.CurrentTick = saveTime;
            app.Pause = 0;
          end

          function pauseMovie(app,hObject,event)
            Pause = 1;
          end
        end



        function sliderValueChanged(app,hObject,eventdata)
          app.Pause = 1;
          diffFromRealTime = abs(app.Outputs.time - app.TimeSlider.Value);
          [~,indMin] = min(diffFromRealTime);
          app.TimeSlider.Value = app.Outputs.time(indMin);
          app.CurrentTick = indMin;

          image(app.PFMovie, app.pfMatrix(:,:,app.CurrentTick));
          colormap(protocolormap);
        end


        function closeApp(app,hObject,eventdata)
          delete(app.Figure);
          delete(app.CapFigure);
        end

        function pushPublish(app,hObject,eventdata)
          createResults(app.Parameters, app.Kinetics, app.Outputs);
          %set(app.Figure, 'Visible', 'off');
          %open('lib/export/output.html');
          fileName = what('lib/export')
          fileName = strcat('file://', fileName.path, '/output.html')
          inputdlg({'Paste the following in your web browser to view export:'}, 'Export Instructions', [1, length(fileName)], {fileName})
          %set(app.Figure, 'Visible', 'on');
        end

    end
end
