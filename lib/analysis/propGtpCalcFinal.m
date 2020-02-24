function propGtp = propGtpCalcFinal(finalPfs)
  gtpNum = 0;
  gdpNum = 0;
  for ii=1:length(finalPfs)
    if (isPf(finalPfs{ii}))
      gtpNum = gtpNum + sum(finalPfs{ii}==2) + sum(finalPfs{ii}==4);
      gdpNum = gdpNum + sum(finalPfs{ii}==1) + sum(finalPfs{ii}==3);
    end
  end

  propGtp =gtpNum./(gtpNum+gdpNum);
end