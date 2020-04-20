function [allPfs, pfLocations] = fragmentGtp(allPfs, pfLocations)
  pfGtp= countPfGtp(allPfs);
  
  totalGtp = sum(pfGtp);
  normalizedPfGtp = pfGtp./totalGtp;
  sumNormPfGtp = cumsum(normalizedPfGtp);

  r = rand;
  lessThanInd = find(r<sumNormPfGtp);
  fragmentedPfInd = lessThanInd(1);
  pf = allPfs{fragmentedPfInd};
  pfInternal = pf(2:end);

  gtpInd = [find(pfInternal == 2); find(pfInternal == 4); find(pfInternal == 6)];
  interfaceSubunitInd = gtpInd(ceil(rand.*(length(gtpInd))));
  allPfs{fragmentedPfInd} = pf(interfaceSubunitInd+2:end);
  allPfs{length(allPfs)+1} = pf(1:interfaceSubunitInd+1);
  pfLocations = [pfLocations pfLocations(fragmentedPfInd)-length(allPfs{fragmentedPfInd})];
end
