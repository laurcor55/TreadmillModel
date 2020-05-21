function meanVelocity = velocitySs(Outputs, ax)
  [~, ssInd] = min(abs(Outputs.time - (Outputs.time(end) - 5)));
  ssPfs = Outputs.savePfs{ssInd};
  finalPfs = Outputs.savePfs{end};
  ssLocations = Outputs.saveLocations{ssInd};
  finalLocations = Outputs.saveLocations{end};
  ssTime = Outputs.time(end) - Outputs.time(ssInd);

  minPfs = min([length(ssPfs), length(finalPfs)]);
  velocityBottom = [];
  velocityTop = [];
  for ii=1:minPfs 
    ssLength = length(ssPfs{ii});
    finalLength = length(finalPfs{ii});
    if (ssLength>5 && finalLength>5)
      velocityBottom = [velocityBottom, (finalLocations(ii) - ssLocations(ii))./ssTime];
      ssTopLocation = ssLocations(ii) - ssLength;
      finalTopLocation = finalLocations(ii) - finalLength;
      velocityTop = [velocityTop, (finalTopLocation - ssTopLocation)./ssTime];
    end
  end
  edges = -15:15;
  
  bottom = histcounts(velocityBottom, edges, 'Normalization', 'probability');
  top = histcounts(velocityTop, edges, 'Normalization', 'probability');
  
  plot(ax, edges(2:end)-1, bottom);
  hold(ax, 'on');
  plot(ax, edges(2:end)-1, top);
  title(ax, 'Treadmilling Velocity at SS');
  xlabel('Velocity (subunits/sec)')
  ylabel('Frequency')
  legend(ax, {'Bottom Association', 'Top Dissociation'}, 'Location', 'northwest');
  hold(ax, 'off');
  meanVelocity = mean([velocityBottom, velocityTop]);
end