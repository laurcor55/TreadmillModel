function [Subunits, gdpOffCount] = exchangeMonomerGdp(Subunits, gdpOffCount)
  Subunits.monomerNum = Subunits.monomerNum + 1;
  Subunits.gdpMonomerNum = Subunits.gdpMonomerNum - 1;
end
