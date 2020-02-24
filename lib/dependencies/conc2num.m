% Formula for converting concentration to inter count of molecule in one bacteria cell.
function num = conc2num(conc)
  num = conc./(10.^6/(2.*10.^-15.*6.022.*10.^23));
end