% Generates color number identifier for red or green subunits in PF. Used in mixing experiments
function gtpColor = gtpColorAssign(currentPFSet)
  if (currentPFSet == 2 && rand < 0.5)
    gtpColor = 4;
  else
    gtpColor = 2;
  end
end
