function mixedPfs = mixPfs(allPfs)
  pfInd = 1;
  for ii=1:length(allPfs)
    if (length(allPfs{ii})>1) 
      mixedPfs{pfInd} = allPfs{ii} + 2*mod(pfInd, 2);
      pfInd = pfInd + 1;
    end
  end
end
