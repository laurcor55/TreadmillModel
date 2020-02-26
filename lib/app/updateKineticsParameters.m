function [app] = updateKineticsParameters(app)

    kineticsNames = fieldnames(app.Kinetics);
    for ii=1:length(kineticsNames)
        labelName = strcat(kineticsNames{ii}, 'Input');
        if isprop(app.(labelName), 'String')
            app.Kinetics.(kineticsNames{ii}) = str2double(app.(labelName).String);
        end
    end

    parametersNames = {'totalTime', 'concTotalFtsZ', 'concCap'};
    for ii=1:length(parametersNames)
        labelName = strcat(parametersNames{ii}, 'Input');
        if isprop(app.(labelName), 'String')
            app.Parameters.(parametersNames{ii}) = str2double(app.(labelName).String);
        end
    end
end
