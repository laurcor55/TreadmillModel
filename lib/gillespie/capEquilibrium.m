function Subunits = capEquilibrium(Subunits, Kinetics)
  Kd = conc2num(Kinetics.capKd);
  capTot = Subunits.capMonomerNum + Subunits.capDimerNum;
  ftszTot = Subunits.monomerNum + Subunits.capDimerNum;

  capMonomer = 1/2*(capTot - Kd + sqrt(4*capTot*Kd + (capTot - Kd -ftszTot).^2) - ftszTot);

  if (capTot - capMonomer > 0)
    Subunits.capMonomerNum = round(capMonomer);
    Subunits.capDimerNum = capTot - Subunits.capMonomerNum;
    Subunits.monomerNum = ftszTot - Subunits.capDimerNum;
  else
    Subunits.capDimerNum = 0;
  end
end