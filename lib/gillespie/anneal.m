function [allPfs] = anneal(allPfs)
  [~, gtpBottomInd] = countFtszBottom(allPfs);
  chosenPfTop = ceil(rand.*(length(gtpBottomInd)));
  chosenPfTop = gtpBottomInd(chosenPfTop);
  pfTop = allPfs{chosenPfTop};


  [~, gtpPenultimateInd] = countPenultimate(allPfs);
  [~, ind] = find(chosenPfTop == gtpPenultimateInd);
  gtpPenultimateInd(ind) = [];
  chosenPfBottom = ceil(rand.*(length(gtpPenultimateInd)));
  chosenPfBottom = gtpPenultimateInd(chosenPfBottom);
  pfBottom = allPfs{chosenPfBottom};


  allPfs{chosenPfTop} = [pfTop; pfBottom];
  allPfs{chosenPfBottom} = [0];

end
