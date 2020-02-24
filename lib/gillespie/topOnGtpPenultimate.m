function [allPfs,Subunits] = topOnGtpPenultimate(allPfs, Subunits, gtpColor)
  [~, gtpPenultimateInd] = countPenultimate(allPfs);
  chosenPf = ceil(rand.*(length(gtpPenultimateInd)));
  chosenPf = gtpPenultimateInd(chosenPf);
  Subunits.monomerNum = Subunits.monomerNum - 1;
  pf = [gtpColor; allPfs{chosenPf}];
  allPfs{chosenPf} = pf;
end
