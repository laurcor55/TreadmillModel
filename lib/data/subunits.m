function Subunits = subunits(Parameters, Kinetics)
  Subunits.capDimerNum = 0;
  Subunits.highCapDimerNum = 0;

  Subunits.capMonomerNum = round(conc2num(Parameters.concCap));
  Subunits.gdpMonomerNum = round(conc2num(Parameters.concTotalFtsZ)); %%% EDIT HERE %%%
  Subunits.monomerNum = 0;
  Subunits.highMonomerNum = 0;

end
