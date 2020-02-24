function protocolor = protocolormap

  % % Creates a colormap for subunits in protofilaments; red green blue

  protocolor = zeros(6,3);
  protocolor(1,:) = 0.7; % Nothing is gray

  % When color == 1, red pfs
  
  protocolor(2,:) = [232, 153, 35]./255; % FtsZ-GDP Light orange
  protocolor(3,:) = [200, 78, 0]./255; % FtsZ-GTP Dark red


  % When color == 2, green pfs
  protocolor(4,:) = [161, 183, 13]./255; % FtsZ-GDP Light green
  protocolor(5,:) = [29, 99, 99]./255; % FtsZ-GTP dark green

  % Bottom Caps are purple
  protocolor(6,:) = [100, 100, 100]./255; %
  protocolor(7,:) = [0, 0, 0]./255; % If FRET, bottom subunit is purple
end
