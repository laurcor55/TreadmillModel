function [pf, Subunits, gdpOffCount] = removeShortPf(pf, Subunits, gdpOffCount);

  if (length(pf)==1)
    if (pf==5) ||(pf==6)
      Subunits.capDimerNum = Subunits.capDimerNum + 1;
    elseif (pf>0)
      Subunits.monomerNum = Subunits.monomerNum + 1;
    end
    if (pf==1 || pf==3|| pf==5)
      gdpOffCount = gdpOffCount + 1;
    end
    pf = [0];
  end
end
