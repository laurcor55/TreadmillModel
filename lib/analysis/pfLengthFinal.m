function meanLength = pfLengthFinal(finalPfs, ax)
  cla(ax, 'reset')
  pfLens = zeros(1, length(finalPfs));
  for ii=1:length(finalPfs)
    pfLens(ii) = length(finalPfs{ii});
  end

  ind = find(pfLens>2);
  pfLens = pfLens(ind);

  hist(ax, pfLens);
  title(ax, 'Pf Length at SS');
  xlabel('Length (subunits)')
  ylabel('Frequency')
  meanLength = mean(pfLens);
end