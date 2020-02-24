function hydrolysisSs = hydrolysisRate(hydrolysisCount, time, ax)
  cla(ax, 'reset');
  timePoints = length(hydrolysisCount);
  hydrolysisRate = zeros(1, timePoints);
  for ii = 2:timePoints;
    hydDiff = num2conc((hydrolysisCount(ii) - hydrolysisCount(ii-1)));
    timeDiff = (time(ii)-time(ii-1))./60;
    hydrolysisRate(ii-1:ii) = hydDiff./timeDiff;
  end
  
  plot(ax, time, hydrolysisRate);
  title(ax, 'GTP Turnover over Time');
  ylabel(ax, 'GTP Turnover uM GTP/s');
  xlabel(ax, 'Time (sec)');
  [~, ssInd] = min(abs(time - (time(end) - 10)));
  hydrolysisSs = num2conc(hydrolysisCount(end)-hydrolysisCount(ssInd))./(time(end)-time(ssInd)).*60;
end