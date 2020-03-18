function [allPfs, pfLocations] = fragmentation(allPfs, pfLocations)
  totalGTP = 0;
  pfGdp= countPfGdp(allPfs);
  
  totalGdp = sum(pfGdp);
  normalizedPfGdp = pfGdp./totalGdp;
  sumNormPfGdp = cumsum(normalizedPfGdp);

  r = rand;
  lessThanInd = find(r<sumNormPfGdp);
  fragmentedPfInd = lessThanInd(1);
  pf = allPfs{fragmentedPfInd};
  gdpInd = [find(pf == 1); find(pf == 3); find(pf == 5)];
  interfaceSubunitInd = gdpInd(ceil(rand.*(length(gdpInd))));
  allPfs{fragmentedPfInd} = pf(1:interfaceSubunitInd);
  allPfs{length(allPfs)+1} = pf(interfaceSubunitInd+1:end);
  pfLocations = [pfLocations 0];
end
