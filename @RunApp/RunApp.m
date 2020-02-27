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
          app.formatApp();
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

        function startExperiment(app,hObject,eventdata)
          app = updateKineticsParameters(app); % apply user's parameters
          app.Outputs = runExperiment(app.Parameters, app.Kinetics, true);
          outputType = 1;
          app.pfMatrix = plotOutputs(app.Outputs, app.Parameters, app);
        end

        function closeApp(app,hObject,eventdata)
          delete(app.Figure);
          delete(app.CapFigure);
        end

        pfMoviePlay(app,hObject,eventdata);
        pfMovieUpdateTime(app,hObject,eventdata);
        capApplyKinetics(app,hObject,eventdata);


        publishResults(app,hObject,eventdata);

        

    end
end
