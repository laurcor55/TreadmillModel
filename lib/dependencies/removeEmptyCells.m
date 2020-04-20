function [allPFsCrop, allPFLocationCrop] = removeEmptyCells(allPFs, allPFLocation, currentTime, roundTime);
  if currentTime < roundTime - 16

    pfCount = 0;
    allPFsCrop = {};
    allPFLocationCrop = [];
    for qq = 1:length(allPFs)
      if (allPFs{qq}>0)
        pfCount = pfCount + 1;
        allPFsCrop{pfCount} = allPFs{qq};
        allPFLocationCrop = [allPFLocationCrop allPFLocation(qq)];
      end
    end
  else
    allPFsCrop = allPFs;
    allPFLocationCrop = allPFLocation;    
  end

end
