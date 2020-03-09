function [allPfs, pfLocations, Subunits] = nucleationCap(allPfs, pfLocations, Subunits, gtpColor)
  addedPFs = [gtpColor; 6];
  len = length(allPfs);
  allPfs{len+1} = addedPFs;
  pfLocations = [pfLocations 0];

  Subunits.capDimerNum = Subunits.capDimerNum - 1;
  Subunits.monomerNum = Subunits.monomerNum - 1;
end
