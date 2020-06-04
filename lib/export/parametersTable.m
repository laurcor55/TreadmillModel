function parametersTable(Parameters, Kinetics, folderName)
  if (Parameters.mixPFs==0)
    mixPfsString = 'no';
  else
    mixPfsString = 'yes';
  end

  parameters = {{0,'Parameters'},
               {'Time', num2str(Parameters.totalTime)},
               {'[FtsZ]', num2str(Parameters.concTotalFtsZ)},
               {'PF Mixing Experiment?', mixPfsString},
               {'[Cap]', num2str(Parameters.concCap)}};
  kineticsPf = {{0, 'Kinetics', 0}, 
              {'Penultimate Subunit', 'GDP', 'GTP'}, 
              {'Top On', num2str(Kinetics.ktongdp), num2str(Kinetics.ktongtp)},
              {'Top Off', num2str(Kinetics.ktoffgdp), num2str(Kinetics.ktoffgtp)},
              {'Bottom Subunit', 'GDP', 'GTP'}, 
              {'Bottom On', num2str(Kinetics.kbongdp), num2str(Kinetics.kbongtp)},
              {'Bottom Off', num2str(Kinetics.kboffgdp), num2str(Kinetics.kboffgtp)}};

  kinetics = {{0,'Kinetics'}
              {'GDP Exchange', num2str(Kinetics.kgdpexchange)},
              {'intrinsic GTPase', num2str(Kinetics.khyd)},
              {'Knuc', num2str(Kinetics.knuc)},
              {'kanneal', num2str(Kinetics.kanneal)},
              {'kfragment', num2str(Kinetics.kfragment)}};


  f = fopen(strcat(folderName, '/parametersTable1.html'), 'w+');
  printTable(f, parameters, 2);
  printTable(f, kinetics, 2);
  fclose(f);

  f = fopen(strcat(folderName, '/parametersTable2.html'), 'w+');
  printTable(f, kineticsPf, 3);
  fclose(f);
end