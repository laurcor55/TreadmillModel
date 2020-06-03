function [allPfs] = anneal(allPfs)
  
  [~, gtpPenultimateInd, ~] = countPenultimate(allPfs);
  chosenPfBottom = ceil(rand.*(length(gtpPenultimateInd)));
  chosenPfBottom = gtpPenultimateInd(chosenPfBottom);
  pfBottom = allPfs{chosenPfBottom};
  
  [~, gtpBottomInd] = countFtszBottom(allPfs);
  [~, ind] = find(chosenPfBottom == gtpBottomInd);
  gtpBottomInd(ind) = [];
  chosenPfTop = ceil(rand.*(length(gtpBottomInd)));
  chosenPfTop = gtpBottomInd(chosenPfTop);
  pfTop = allPfs{chosenPfTop};

  r = rand();
  if (r<0.5)
    allPfs{chosenPfTop} = [pfTop; pfBottom];
    allPfs{chosenPfBottom} = [0];
  else
    allPfs{chosenPfBottom} = [pfTop; pfBottom];
    allPfs{chosenPfTop} = [0];

  end

end
