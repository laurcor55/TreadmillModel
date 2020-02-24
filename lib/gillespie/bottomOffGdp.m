function [allPfs, Subunits, pfLocations, gdpOffCount] = bottomOffGdp(allPfs, Subunits, pfLocations, gdpOffCount)
  [gdpBottomInd, ~] = countFtszBottom(allPfs);
  chosenPf = ceil(rand.*(length(gdpBottomInd)));
  chosenPf = gdpBottomInd(chosenPf);
  pf = allPfs{chosenPf};
  gdpOffCount = gdpOffCount + 1;
  Subunits.monomerNum = Subunits.monomerNum + 1;
  allPfs{chosenPf} = allPfs{chosenPf}(1:end-1);
  pfLocations(chosenPf) = pfLocations(chosenPf) - 1;
  [allPfs{chosenPf}, Subunits, gdpOffCount] = removeShortPf(allPfs{chosenPf}, Subunits, gdpOffCount);
end
