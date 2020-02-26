function [app] = updateKineticsParameters(app)
    app.Kinetics.kbongtp = str2double(app.kbongtpInput.String);
    app.Kinetics.kboffgtp = str2double(app.kboffgtpInput.String);

    app.Kinetics.kbongdp = str2double(app.kbongdpInput.String);
    app.Kinetics.kboffgdp = str2double(app.kboffgdpInput.String);

    app.Kinetics.ktongdp = str2double(app.ktongdpInput.String);
    app.Kinetics.ktoffgdp = str2double(app.ktoffgdpInput.String);
    app.Kinetics.ktongtp = str2double(app.ktongtpInput.String);
    app.Kinetics.ktoffgtp = str2double(app.ktoffgtpInput.String);
    
    app.Kinetics.knuc = str2double(app.knucInput.String);
    app.Kinetics.kgdpexchange = str2double(app.kgdpexchangeInput.String);
    app.Kinetics.khyd = str2double(app.khydInput.String);

    app.Parameters.concTotalFtsZ = str2double(app.ConcFtsZInput.String);
    app.Parameters.totalTime = str2double(app.TimeInput.String);
end
