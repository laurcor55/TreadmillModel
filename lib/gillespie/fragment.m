function [allPfs, pfLocations] = fragment(allPfs, pfLocations)
  totalGTP = 0;
  pfGdp= countPfGdp(allPfs);
  
  totalGdp = sum(pfGdp);
  normalizedPfGdp = pfGdp./totalGdp;
  sumNormPfGdp = cumsum(normalizedPfGdp);

  r = rand;
  lessThanInd = find(r<sumNormPfGdp);
  fragmentedPfInd = lessThanInd(1);
  pf = allPfs{fragmentedPfInd};
  pfInternal = pf(3:end-1);

  gdpInd = [find(pfInternal == 1); find(pfInternal == 3); find(pfInternal == 5)];
  interfaceSubunitInd = gdpInd(ceil(rand.*(length(gdpInd))))+2;
  allPfs{fragmentedPfInd} = pf(interfaceSubunitInd+1:end);
  allPfs{length(allPfs)+1} = pf(1:interfaceSubunitInd);
  pfLocations = [pfLocations pfLocations(fragmentedPfInd)-length(allPfs{end})];
  
end
