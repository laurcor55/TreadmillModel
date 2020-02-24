function [allPfs,Subunits, pfLocations] = bottomOnGtp(allPfs,Subunits, gtpColor, pfLocations)
  [~, gtpBottomInd] = countFtszBottom(allPfs);
  chosenPf = ceil(rand.*(length(gtpBottomInd)));
  chosenPf = gtpBottomInd(chosenPf);
  pf = allPfs{chosenPf};
  Subunits.monomerNum = Subunits.monomerNum - 1;
  pfLocations(chosenPf) = pfLocations(chosenPf)+1;
  allPfs{chosenPf} = [allPfs{chosenPf}; gtpColor];
end
