

Subunits.capDimerNum = 100;
Subunits.capMonomerNum = 1000;
Subunits.monomerNum = 10000;
Subunits.gdpMonomerNum = 2000;
Subunits.highMonomerNum = 100;


Kinetics = kinetics();
Kinetics.capKd = 0.15;

Subunits = capEquilibrium(Subunits, Kinetics);

ratio = (num2conc(Subunits.monomerNum) .* num2conc(Subunits.capMonomerNum))./num2conc(Subunits.capDimerNum);

assert(abs(ratio-0.15) < 0.01)
assert(Subunits.gdpMonomerNum == 2000);
assert(Subunits.highMonomerNum == 100);