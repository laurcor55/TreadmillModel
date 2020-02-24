function [allPfs,Subunits] = topOnGdpPenultimate(allPfs, Subunits, gtpColor)
  [gdpPenultimateInd, ~] = countPenultimate(allPfs);
  chosenPf = ceil(rand.*(length(gdpPenultimateInd)));
  chosenPf = gdpPenultimateInd(chosenPf);
  Subunits.monomerNum = Subunits.monomerNum - 1;
  pf = [gtpColor; allPfs{chosenPf}];
  allPfs{chosenPf} = pf;
end
