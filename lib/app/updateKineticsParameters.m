function [app] = updateKineticsParameters(app)
    app.Kinetics.kbongtp = str2double(app.KbOnGtpInput.String);
    app.Kinetics.kboffgtp = str2double(app.KbOffGtpInput.String);

    app.Kinetics.kbongdp = str2double(app.KbOnGdpInput.String);
    app.Kinetics.kboffgdp = str2double(app.KbOffGdpInput.String);

    app.Kinetics.ktongdp = str2double(app.KtOnInput.String);
    app.Kinetics.ktoffgdp = str2double(app.KtOffInput.String);
    app.Kinetics.ktongtp = str2double(app.KtLowOnInput.String);
    app.Kinetics.ktoffgtp = str2double(app.KtLowOffInput.String);
    
    app.Kinetics.kswitch = str2double(app.kswitchInput.String);
    app.Kinetics.kgdpexchange = str2double(app.kgdpexchangeInput.String);
    app.Kinetics.indGtpaseRate = str2double(app.GTPaseInput.String);

    app.Parameters.concTotalFtsZ = str2double(app.ConcFtsZInput.String);
    app.Parameters.totalTime = str2double(app.TimeInput.String);
end
