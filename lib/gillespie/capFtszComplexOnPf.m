function [allPfs, Subunits, pfLocations] = capFtszComplexOnPf(allPfs, Subunits, pfLocations)
  [gdpBottomInd, gtpBottomInd] = countFtszBottom(allPfs);
  ftszBottomInd = [gtpBottomInd];%, gdpBottomInd];
  chosenPf = ceil(rand.*(length(ftszBottomInd)));
  chosenPf = ftszBottomInd(chosenPf);
  allPfs{chosenPf} = [allPfs{chosenPf}; 6];
  pfLocations(chosenPf) = pfLocations(chosenPf) + 1;
  Subunits.capMonomerNum = Subunits.capMonomerNum - 1;
  Subunits.monomerNum = Subunits.monomerNum - 1;
end
