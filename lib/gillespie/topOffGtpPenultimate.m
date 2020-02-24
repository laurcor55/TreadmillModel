function [allPfs, Subunits, gdpOffCount] = topOffGtpPenultimate(allPfs, Subunits, gdpOffCount)
  [~, gtpPenultimateInd] = countPenultimate(allPfs);
  chosenPf = ceil(rand.*(length(gtpPenultimateInd)));
  chosenPf = gtpPenultimateInd(chosenPf);
  if (allPfs{chosenPf}(1)==1 ||allPfs{chosenPf}(1)==3)
    gdpOffCount = gdpOffCount + 1;
  end
  Subunits.monomerNum = Subunits.monomerNum + 1;
  allPfs{chosenPf} = allPfs{chosenPf}(2:end);
  [allPfs{chosenPf}, Subunits, gdpOffCount] = removeShortPf(allPfs{chosenPf}, Subunits, gdpOffCount);
end
