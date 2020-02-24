function finalPfs(pfsCells, locationsCells, ax)
  cla(ax, 'reset')
  pfMatrix = cellsTo3DMatrix(pfsCells, locationsCells);
  image(ax, pfMatrix(:,:,end));
  colormap(ax, protocolormap);
end