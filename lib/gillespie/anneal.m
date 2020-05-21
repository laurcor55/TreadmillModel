function [allPfs, pfLocations] = anneal(allPfs, pfLocations)
  
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
    pfLocations(chosenPfTop) = pfLocations(chosenPfTop);% + length(pfBottom);
    allPfs{chosenPfBottom} = [0];
  else
    allPfs{chosenPfBottom} = [pfTop; pfBottom];
    pfLocations(chosenPfBottom) = pfLocations(chosenPfBottom);% - length(pfTop);
    allPfs{chosenPfTop} = [0];
  end

end