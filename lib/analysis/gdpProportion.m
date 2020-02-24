function gdpProportion = gdpProportion(finalPfs)
  gdp = 0;
  gtp = 0;
  for ii=1:length(finalPfs)
    gdp = gdp + sum(finalPfs{ii}==1) + sum(finalPfs{ii}==3)  + sum(finalPfs{ii}==5);
    gtp = gtp + sum(finalPfs{ii}==2) + sum(finalPfs{ii}==4)  + sum(finalPfs{ii}==6);
  end
  gdpProportion = gdp./(gdp + gtp);
end