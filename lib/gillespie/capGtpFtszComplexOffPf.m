function [allPfs, Subunits, pfLocations, gdpOffCount] = capGtpFtszComplexOffPf(allPfs, Subunits, pfLocations, gdpOffCount)
  [gdpCapBottomInd, gtpCapBottomInd] = countCapBottom(allPfs);
  capBottomInd = [gtpCapBottomInd];
  chosenPf = ceil(rand.*(length(capBottomInd)));

  chosenPf = capBottomInd(chosenPf);
  if (allPfs{chosenPf}(end)==5)
    gdpOffCount = gdpOffCount + 1;
  end
  allPfs{chosenPf} = allPfs{chosenPf}(1:end-1);
  pfLocations(chosenPf) = pfLocations(chosenPf) - 1;
  [allPfs{chosenPf}, Subunits, gdpOffCount] = removeShortPf(allPfs{chosenPf}, Subunits, gdpOffCount);
  Subunits.capMonomerNum = Subunits.capMonomerNum + 1;
  Subunits.monomerNum = Subunits.monomerNum + 1;
end
