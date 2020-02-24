% Gets index of caps on bottom of PF, classified by GDP- or GTP- bound status.

function [gdpCapBottomInd, gtpCapBottomInd] = countCapBottom(allPfs);
  bottomProfile = zeros(1, length(allPfs));
  for ii=1:length(allPfs)
    pf = allPfs{ii};
    if length(pf)>1
      bottomProfile(ii) = pf(end);
    end
  end
  ind = 1:length(allPfs);
  gtpCapBottomInd = ind(bottomProfile==6);
  gdpCapBottomInd = ind(bottomProfile==5);
end
