function [allPfs, gdpOffCount] = exchangeTopGdp(allPfs, gdpOffCount)
  [gdpTopInd, ~] = countTop(allPfs);
  chosenPf = ceil(rand.*(length(gdpTopInd)));
  chosenPf = gdpTopInd(chosenPf);
  gdpOffCount = gdpOffCount + 1;
  allPfs{chosenPf}(1) = allPfs{chosenPf}(1) + 1;
end
