function matrixPFSnapshots = cellsTo3DMatrix(cellPF,cellLocation)
  bottomLocations = cellLocation;
  topLocations = cellLocation;
  for ii=1:length(cellPF)
    for jj=1:length(cellPF{ii})
      topLocations{ii}(jj) = topLocations{ii}(jj) - length(cell2mat(cellPF{ii}(jj)));
    end
  end
  minTopLocation = 100;
  for ii=1:length(topLocations)
    if(min(topLocations{ii})<minTopLocation)
      minTopLocation = min(topLocations{ii});
    end
  end
  maxBottomLocation = 10;
  maxPfNum = 10;
  for ii=1:length(topLocations)
    topLocations{ii} = topLocations{ii} - minTopLocation + 1;
    bottomLocations{ii} = bottomLocations{ii} - minTopLocation;
    if (max(bottomLocations{ii})>maxBottomLocation)
      maxBottomLocation = max(bottomLocations{ii});
    end
    if (length(cellPF{ii})>maxPfNum)
      maxPfNum = length(cellPF{ii});
    end
  end
  
  

  matrixPFSnapshots = int8(zeros(maxBottomLocation,maxPfNum,length(cellLocation)));

  for ii = 1:length(cellLocation)
    for jj = 1:length(cellPF{ii})
      topInd = topLocations{ii}(jj);
      bottomInd = bottomLocations{ii}(jj);
      if (isPf(cellPF{ii}{jj}))
        matrixPFSnapshots(topInd:bottomInd, jj, ii) = int8(cellPF{ii}{jj});
      end
    end
  end
end
