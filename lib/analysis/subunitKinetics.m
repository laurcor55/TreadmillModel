function monomerSs = subunitKinetics(Outputs, ax)
  cla(ax, 'reset')
  plot(ax, Outputs.time, Outputs.monomerConc);
  hold(ax, 'on')
  plot(ax, Outputs.time, Outputs.pfFtszConc);
  hold(ax, 'on')
  if (Outputs.capMonomerConc(1)>0)
    plot(ax, Outputs.time, Outputs.capMonomerConc);
    hold(ax, 'on')
    plot(ax, Outputs.time, Outputs.capDimerConc);
    hold(ax, 'on')
    legend(ax, {'[FtsZ Monomer]', '[FtsZ in Pf]', '[Cap Monomer]', '[Cap-FtsZ Complex'});
  else
    legend(ax, {'[FtsZ Monomer]', '[FtsZ in Pf]'});
  end
  title(ax, 'Subunit Kinetics');
  ylabel(ax, 'Concentration (uM)');
  xlabel(ax, 'Time (sec)');

  monomerSs = mean(Outputs.monomerConc(end-2:end));
end