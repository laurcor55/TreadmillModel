function [allPfs,Subunits] = topOnGdpPenultimateGtpTop(allPfs, Subunits, gtpColor)
  [gdpPenultimateInd, ~, gdpPenultimateGtpTopInd] = countPenultimate(allPfs);
  chosenPf = ceil(rand.*(length(gdpPenultimateInd)));
  chosenPf = gdpPenultimateInd(chosenPf);
  Subunits.monomerNum = Subunits.monomerNum - 1;
  pf = [gtpColor; allPfs{chosenPf}];
  allPfs{chosenPf} = pf;
end
