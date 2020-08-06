function publishResults(Parameters, Kinetics, Outputs, outputTable)
  resultsFigure = figure('visible', 'off', 'Unit', 'inches', 'Renderer', 'painters', 'Position', [0, 0, 8.5, 11]);
  len = 4;
  wid = 2;

  monomerSs = subunitKinetics(Outputs, subplot(len, wid, 1));
  hydrolysisSs = hydrolysisRate(Outputs.hydrolysisCount, Outputs.time, subplot(len, wid, 2));
  meanLength = pfLengthFinal(Outputs.savePfs{end}, subplot(len, wid, 3));
  meanVelocity = velocitySs(Outputs, subplot(len, wid, 4));
  finalPfs(Outputs.savePfs, Outputs.saveLocations, subplot(len, wid, 5));
  
  
  if(Parameters.mixPFs>0)
    mixingKineticsPlot(Outputs.savePfs, Outputs.time, subplot(len, wid, 6));
  end

  %outputTable.Parent = resultsFigure;
  %outputTable.Position = [0.05, 0.05, 0.4, 0.1];
  
  %properties = {'Total Time', '[Total FtsZ]', '[Bottom Cap]', 'PF Mixing Experiment?', 'Disassembly Experiment?'};
  %data = {Parameters.totalTime, Parameters.concTotalFtsZ, Parameters.concCap, logical(Parameters.mixPFs), logical(Parameters.disassemblePfs)}';
  %T = table(data,'RowNames',properties);
  %inputTable = uitable('Parent',resultsFigure,'Data',T{:,:},'ColumnName',{},'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0.05, 0.2, 0.4, 0.1]);
  
  %properties1 = {'Interface Nucleotide:', 'Bottom On', 'Bottom Off', 'Top On', 'Top Off'};
  %data1 = {'GTP', Kinetics.kbongtp, Kinetics.kboffgtp, Kinetics.ktongtp, Kinetics.ktoffgtp}';
  %data2 = {'GDP', Kinetics.kbongdp, Kinetics.kboffgdp, Kinetics.ktongdp, Kinetics.ktoffgdp}';
  %T = table(data1, data2,'RowNames',properties1);
  %inputTable = uitable('Parent',resultsFigure,'Data',T{:, :},'ColumnName',{},'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0.5, 0.05, 0.45, 0.3]);
  
  subplot('Position', [0.02, 0.02, 0.96, 0.27])
  set(gca, 'YTickLabel', [])
  set(gca, 'XTickLabel', [])
  set(gca, 'YTick', [])
  set(gca, 'XTick', [])

  tableText = '$$ \left [\begin {array}{ccc} 1&2&3\\\noalign{\medskip}4&5&6\\\noalign{\medskip}7&8&9\end {array}\right ]$$';

  lineStart = '$ \left [\begin {array}{ccc} ';
  line1 = '\underline{Interface \ Nucleotide:} & \underline{GTP} & \underline{GDP}'; 
  line2 = strcat('\\\noalign{\medskip} Bottom \ On & ', num2str(Kinetics.kbongtp), ' & ',num2str(Kinetics.kbongdp));
  line3 = strcat('\\\noalign{\medskip} Bottom \ Off & ', num2str(Kinetics.kboffgtp), ' & ',num2str(Kinetics.kboffgdp));
  line4 = strcat('\\\noalign{\medskip} Top \ On & ', num2str(Kinetics.ktongtp), ' & ',num2str(Kinetics.ktongdp));
  line5 = strcat('\\\noalign{\medskip} Top \ Off & ', num2str(Kinetics.ktoffgtp), ' & ',num2str(Kinetics.ktoffgdp));
  lineEnd = '\end {array}\right ]$';
  tableText = strcat(lineStart, line1, line2, line3, line4, line5, lineEnd);
  text(0.05, 0.6, tableText,'Interpreter','latex');

  lineStart = '$ \left [\begin {array}{cc} ';
  line1 = strcat('K_{nuc} & ', num2str(Kinetics.knuc));
  line2 = strcat('\\\noalign{\medskip} k_{GDP \ exchange} & ', num2str(Kinetics.kgdpexchange));
  line3 = strcat('\\\noalign{\medskip} k_{hyd} & ', num2str(Kinetics.khyd));
  lineEnd = '\end {array}\right ]$';
  tableText = strcat(lineStart, line1, line2, line3, lineEnd);
  text(0.05, 0.2, tableText,'Interpreter','latex');

  line4 = strcat('k_{anneal} & ', num2str(Kinetics.kanneal));
  line5 = strcat('\\\noalign{\medskip} k_{fragment} & ', num2str(Kinetics.kfragment));
  tableText = strcat(lineStart, line4, line5, lineEnd);
  text(0.23, 0.2, tableText,'Interpreter','latex');

  lineStart = '$ \left [\begin {array}{cc} ';
  line1 = strcat('Total Time & ', num2str(Parameters.totalTime));
  line2 = strcat('\\\noalign{\medskip} [Total \ FtsZ] & ', num2str(Parameters.concTotalFtsZ));
  line3 = strcat('\\\noalign{\medskip} [Bottom \ Cap] & ', num2str(Parameters.concCap));
  line4 = strcat('\\\noalign{\medskip} PF \ mixing \ experiment? & ', num2str(Parameters.mixPFs));
  line5 = strcat('\\\noalign{\medskip} Disassembly \ experiment? & ', num2str(Parameters.disassemblePfs));
  lineEnd = '\end {array}\right ]$';
  tableText = strcat(lineStart, line1, line2, line3, line4, line5, lineEnd);
  text(0.38, 0.6, tableText,'Interpreter','latex');

  tableText = '$ \left [\begin {array}{cc} ';
  for ii = 1:length(outputTable.Data)
    lineText = strcat(outputTable.RowName{ii}, ' & ', num2str(outputTable.Data(ii)));
    lineText = strrep(lineText, ' ', ' \ ');
    if (ii>1)
      lineText = strcat('\\\noalign{\medskip}', lineText);
    end
    tableText = strcat(tableText, lineText);
  end
  tableText = strcat(tableText, '\end {array}\right ]$');
  text(0.65, 0.6, tableText,'Interpreter','latex');

  text(0.05, 0.9, '$ \underline{Inputs:} $', 'Interpreter', 'latex', 'FontSize', 14);
  text(0.65, 0.9, '$ \underline{Outputs:} $', 'Interpreter', 'latex', 'FontSize', 14);
  saveas(gcf, 'result.pdf');
  saveas(resultsFigure, 'newout', 'fig');

end
