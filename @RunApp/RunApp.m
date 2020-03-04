classdef RunApp < handle
    properties
        Figure;

        Kinetics;
        Parameters;
        Outputs;

        modelPanel;

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
        
        
        mixingButton;
        disassemblyButton;

        CapFigure;
        CapAxes;
        CapDiagram;
        
        capKdInput;
        kcaponpfInput;
        kcapoffpfInput;
        kcapoffpfgdpInput;



        concTotalFtsZInput;
        concCapInput;
        totalTimeInput;

        InputPanel;
        InputAxes;

        capButton;
        runButton;
        SavePFs;

        monomerPlot;
        gtpTurnoverPlot;
        lengthPlot;
        velocityPlot;
        mixingPlot;

        outputTable;
        moviePanel;

        
        PrintoutTable;

        pfMovie;
        pfMoviePlayButton;
        pfMoviePauseButton;
        pfMoviePause;
        pfMovieSliderValueChange;


        pfMovieTimeSlider;
        pfMovieTimeSliderLabel;
        
        CurrentTick;
        Data;

        publishButton;
        pfMatrix
    end

    methods
        function app = RunApp;
          addpath('lib', 'lib/analysis', 'lib/data', 'lib/dependencies', 'lib/gillespie', 'lib/export', 'media')
          addpath('media')
          app.Parameters = parameters();
          app.Kinetics = kineticsBs();
          app.formatApp();
        end

       

        function editDisassembly(app,hObject,eventdata)
          disassemblyFormatPopup(app);
        end

        function startExperiment(app,hObject,eventdata)
          app = updateKineticsParameters(app); % apply user's parameters
          app.Outputs = runExperiment(app.Parameters, app.Kinetics, true);
          app.plotOutputs(hObject,eventdata);
        end

        function closeApp(app,hObject,eventdata)
          delete(app.Figure);
          delete(app.CapFigure);
        end

        capFormatPopup(app, hObject, eventdata);
        capApplyKinetics(app,hObject,eventdata);
        capAddParameter(app, parameterName, location, units);
        capAddKinetic(app, kineticName, location, units);

        disassemblyFormatPopup(app, hObject, eventdata);

        mixingFormatPopup(app, hObject, eventdata);

        pfMoviePlay(app,hObject,eventdata);
        pfMovieUpdateTime(app,hObject,eventdata);
        

        formatApp(app);
        addParameter(app, parameterName, location, units);
        addButton(app, buttonName, label, location, style, callback);
        plotOutputs(app,hObject,eventdata);
        publishResults(app,hObject,eventdata);
        

    end
end
