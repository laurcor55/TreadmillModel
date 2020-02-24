function [allPfs, Subunits, pfLocations, gdpOffCount] = bottomOffGtp(allPfs, Subunits, pfLocations, gdpOffCount)
  [~, gtpBottomInd] = countFtszBottom(allPfs);
  chosenPf = ceil(rand.*(length(gtpBottomInd)));
  chosenPf = gtpBottomInd(chosenPf);
  Subunits.monomerNum = Subunits.monomerNum + 1;
  allPfs{chosenPf} = allPfs{chosenPf}(1:end-1);
  pfLocations(chosenPf) = pfLocations(chosenPf) - 1;
  [allPfs{chosenPf}, Subunits, gdpOffCount] = removeShortPf(allPfs{chosenPf}, Subunits, gdpOffCount);
end
