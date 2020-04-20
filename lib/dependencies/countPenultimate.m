% Gets index of subunits in penultimate state of PF, classified by GDP- or GTP- bound status.

function [gdpPenultimateInd, gtpPenultimateInd, gtpGtpPenultimateInd] = countPenultimate(allPfs)
  penultimateProfile = zeros(1, length(allPfs));
  topProfile = zeros(1, length(allPfs));

  for ii=1:length(allPfs)
    pf = allPfs{ii};
    if length(pf)>1
      penultimateProfile(ii) = pf(2);
      topProfile(ii) = pf(1);
    end
  end
  ind = 1:length(allPfs);
  gtpPenultimateInd = ind(penultimateProfile==2|penultimateProfile==4|penultimateProfile==6);
  gdpPenultimateInd = ind(penultimateProfile==1|penultimateProfile==3|penultimateProfile==5);
  gtpGtpPenultimateInd = ind((penultimateProfile==2|penultimateProfile==4|penultimateProfile==6) & (topProfile==2 | topProfile==4));

end
