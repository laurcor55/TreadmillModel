function [allPfs, pfLocations, Subunits] = nucleation(allPfs, pfLocations, Subunits, gtpColor)
  addedPFs = [gtpColor; gtpColor];
  len = length(allPfs);
  allPfs{len+1} = addedPFs;
  pfLocations = [pfLocations 0];

  Subunits.monomerNum = Subunits.monomerNum - 2; %%%%% CHANGE HERE %%%%%%
  Subunits.highMonomerNum = Subunits.highMonomerNum - 0;
end
