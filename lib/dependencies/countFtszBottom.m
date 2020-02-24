% Gets index of FtsZ on bottom of PF, classified by GDP- or GTP- bound status.

function [gdpBottomInd, gtpBottomInd] = countFtszBottom(allPfs);
  bottomProfile = zeros(1, length(allPfs));

  for ii=1:length(allPfs)
    pf = allPfs{ii};
    if length(pf)>1
      bottomProfile(ii) = pf(end);
    end
  end
  ind = 1:length(allPfs);
  gtpBottomInd = ind(bottomProfile==2|bottomProfile==4);
  gdpBottomInd = ind(bottomProfile==1|bottomProfile==3);
end
