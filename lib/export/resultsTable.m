function resultsTable(monomerSs, hydrolysisSs, pfLength, meanVelocity, finalPropGtp)
  results = {{0, 'Results at Steady State'},
            {'[Monomer]', num2str(monomerSs)},
            {'Hydrolysis', num2str(hydrolysisSs)},
            {'PF Length', num2str(pfLength)},
            {'Treadmill Velocity', num2str(meanVelocity)},
            {'Proportion GTP in PF', num2str(finalPropGtp*100)}};
  f = fopen('lib/export/output/resultsTable.html', 'w+');
  printTable(f, results, 2);
  fclose(f);
  
end

