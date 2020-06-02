function createResults(Parameters, Kinetics, Outputs, fileExtension)
  f1 = figure;
  len = 3;
  wid = 2;

  monomerSs = subunitKinetics(Outputs, subplot(len, wid,1));
  hydrolysisSs = hydrolysisRate(Outputs.hydrolysisCount, Outputs.time, subplot(len, wid,2));
  meanLength = pfLengthFinal(Outputs.savePfs{end}, subplot(len, wid, 3));

  meanVelocity = velocitySs(Outputs, subplot(len, wid,4));
  finalPfs(Outputs.savePfs, Outputs.saveLocations, subplot(len, wid, 5));
  
  
  if(Parameters.mixPFs>0)
    mixingKineticsPlot(Outputs.savePfs, Outputs.time, subplot(len, wid,6));
  end

  f1.PaperUnits = 'inches';
  f1.PaperPosition = [0 0 8 8];
  currentFolder = pwd;
  exportFolder = strcat(currentFolder, '/lib/export/data/export', fileExtension);
  mkdir(exportFolder);
  fileNameNew = strcat(exportFolder, '/output.html');
  copyfile(strcat(currentFolder, '/lib/export/output.html'), fileNameNew);
  fileNameNew = strcat(exportFolder, '/outputStyle.css');
  copyfile(strcat(currentFolder, '/lib/export/outputStyle.css'), fileNameNew);
  fileNameNew = strcat(exportFolder, '/minimal-table.css');
  copyfile(strcat(currentFolder, '/lib/export/minimal-table.css'), fileNameNew);
  saveas(f1,strcat(exportFolder, '/output.png'));
  close(f1);


  finalPropGtp = propGtpCalcFinal(Outputs.savePfs{end});

  parametersTable(Parameters, Kinetics, exportFolder);  
  resultsTable(monomerSs, hydrolysisSs, meanLength, meanVelocity, finalPropGtp, exportFolder); 
end
