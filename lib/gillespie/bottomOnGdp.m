function [allPfs,Subunits, pfLocations] = bottomOnGtp(allPfs,Subunits, gtpColor, pfLocations)
  [gdpBottomInd, ~] = countFtszBottom(allPfs);
  chosenPf = ceil(rand.*(length(gdpBottomInd)));
  chosenPf = gdpBottomInd(chosenPf);
  pf = allPfs{chosenPf};
  Subunits.monomerNum = Subunits.monomerNum - 1;
  pfLocations(chosenPf) = pfLocations(chosenPf)+1;
  allPfs{chosenPf} = [allPfs{chosenPf}; gtpColor];
end
