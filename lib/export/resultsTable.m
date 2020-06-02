function resultsTable(monomerSs, hydrolysisSs, pfLength, meanVelocity, finalPropGtp, folderName)
  results = {{0, 'Results at Steady State'},
            {'[Monomer]', num2str(monomerSs)},
            {'Hydrolysis', num2str(hydrolysisSs)},
            {'PF Length', num2str(pfLength)},
            {'Treadmill Velocity', num2str(meanVelocity)},
            {'Proportion GTP in PF', num2str(finalPropGtp*100)}};
  f = fopen(strcat(folderName, '/resultsTable.html'), 'w+');
  printTable(f, results, 2);
  fclose(f);
  
end

