
Subunits.capDimerNum = 10;
Subunits.capMonomerNum = 10;
Subunits.gdpMonomerNum = 10;
Subunits.monomerNum = 10;

Subunits = exchangeMonomerGdp(Subunits);

assert(Subunits.gdpMonomerNum == 9);
assert(Subunits.monomerNum == 11);
assert(Subunits.capDimerNum == 10);
assert(Subunits.capMonomerNum == 10);
