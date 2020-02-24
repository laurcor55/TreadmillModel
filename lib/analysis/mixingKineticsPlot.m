function pfMixingKinetics = mixingKineticsPlot(pfCells, time, ax)
  pfMixingKinetics = zeros(1, length(pfCells));

  for ii = 1:length(pfCells)
    cellSnapshot = pfCells{ii};
    fretSignal = 0;
    totalInterfaces = 0;
    for jj = 1:length(cellSnapshot)
      if length(cellSnapshot{jj}>1)
        for kk = 2:length(cellSnapshot{jj})
          if ((cellSnapshot{jj}(kk)==1) || (cellSnapshot{jj}(kk)==2)) && ((cellSnapshot{jj}(kk-1)==3) || (cellSnapshot{jj}(kk-1)==4))
            fretSignal = fretSignal + 1;
          elseif ((cellSnapshot{jj}(kk)==3) || (cellSnapshot{jj}(kk)==4)) && ((cellSnapshot{jj}(kk-1)==1) || (cellSnapshot{jj}(kk-1)==2))
            fretSignal = fretSignal + 1;
          end
          totalInterfaces = totalInterfaces + 1;
        end
      end
    end
    pfMixingKinetics(ii) = fretSignal/totalInterfaces;
  end

  plot(ax, time, pfMixingKinetics);
  title(ax, 'Inter-Pf Subunit Exchange');
  ylabel(ax, 'Proportion of Pf Mixed');
  xlabel(ax, 'Time (sec)');
end