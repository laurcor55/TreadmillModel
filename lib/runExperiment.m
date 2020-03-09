function Outputs = runExperiment(Parameters, Kinetics, popup)
  
  % Initialize book keeping parameters
  [Subunits, totalRounds, collectSampleStep] = initializeExperiment(Parameters, Kinetics); 
  roundCount = 1;
  allPfs = {};
  if (popup)
    waitPopup = waitbar(0, 'Running experiment...');
  end

  % Only one round if normal experiment. Three rounds if generating PFs then mixing them. 
  while (roundCount<=totalRounds) 

    % Initialize data for specific round.
    [pfLocations, Subunits, Outputs, roundTime] = initializeRound(Parameters, Subunits, Kinetics, allPfs, roundCount); 
    currentTime = 0;
    iteration = 0;
    gdpOffCount = 0;

    % Repeat this until iterated through entire time
    while (currentTime < roundTime) 
      gtpColor = gtpColorAssign(roundCount); % Assigns a "color" identifier to FtsZ. Important in pf mixing experiment
      Subunits = capEquilibrium(Subunits, Kinetics);
      
      %%%%% GILLESPIE ALGORITHM %%%%%
      [eventProbabilities, tau, Subunits] = determineTau(Subunits, allPfs, Kinetics); % Determines time step and relative probabilities of each reaction
      eventChosen = determineEvent(eventProbabilities); % Picks one event to occur based off event probabilities
      
      % Implement event chosen from gillespie algorithm
      switch eventChosen 
        case 1 % Cap off bottom of PF (bottom subunit is GTP bound)
          [allPfs, Subunits, pfLocations, gdpOffCount] = capGtpFtszComplexOffPf(allPfs, Subunits, pfLocations, gdpOffCount);
        case 2 % Cap on bottom of PF (bottom subunit is GTP bound)
          [allPfs, Subunits, pfLocations] = capFtszComplexOnPf(allPfs, Subunits, pfLocations);
        case 3 % FtsZ subunit off bottom of PF (bottom subunit is GTP bound)
          [allPfs, Subunits, pfLocations, gdpOffCount] = bottomOffGtp(allPfs, Subunits, pfLocations, gdpOffCount);
        case 4 % FtsZ monomer on bottom of PF (bottom subunit is GTP bound)
          [allPfs, Subunits, pfLocations] = bottomOnGtp(allPfs, Subunits, gtpColor, pfLocations);
        case 5 % Free monomer exchanges GDP for GTP
          [Subunits, gdpOffCount] = exchangeMonomerGdp(Subunits, gdpOffCount);
        case 6 % Subunit in PF hydrolyzes GTP
          allPfs = hydrolysis(allPfs);
        case 7 % Nucleate new PF from one T state monomer and one R state monomer
          [allPfs, pfLocations, Subunits] = nucleation(allPfs, pfLocations, Subunits, gtpColor);
        case 8 % FtsZ subunit off top of PF (penultimate subunit is GDP bound)
          [allPfs, Subunits, gdpOffCount] = topOffGdpPenultimate(allPfs, Subunits, gdpOffCount);
        case 9 % FtsZ subunit off top of PF (penultimate subunit is GTP bound)
          [allPfs, Subunits, gdpOffCount] = topOffGtpPenultimate(allPfs, Subunits, gdpOffCount);
        case 10 % FtsZ monomer on top of PF (penultimate subunit is GDP bound)
          [allPfs,Subunits] = topOnGdpPenultimate(allPfs, Subunits, gtpColor);
        case 11 % FtsZ monomer on top of PF (penultimate subunit is GTP bound)
          [allPfs, Subunits] = topOnGtpPenultimate(allPfs, Subunits, gtpColor);
        case 12 % Nucleate new PF from T state monomer and R state FtsZ:Cap heterodimer
          [allPfs, pfLocations, Subunits] = nucleationCap(allPfs, pfLocations, Subunits, gtpColor);
        case 13 % FtsZ subunit off bottom of PF (bottom subunit is GDP bound)
          [allPfs, Subunits, pfLocations, gdpOffCount] = bottomOffGdp(allPfs, Subunits, pfLocations, gdpOffCount);
        case 14 % FtsZ monomer on bottom of PF (bottom subunit is GDP bound)
          [allPfs, Subunits, pfLocations] = bottomOnGdp(allPfs, Subunits, gtpColor, pfLocations);
        case 15 % Cap off bottom of PF (bottom subunit is GDP bound)
          [allPfs, Subunits, pfLocations, gdpOffCount] = capGdpFtszComplexOffPf(allPfs, Subunits, pfLocations, gdpOffCount);
        case 16 % Nucleate new PF from T state FtsZ:Cap heterodimer and R state monomer
          [allPfs, pfLocations, Subunits] = nucleationCap(allPfs, pfLocations, Subunits, gtpColor);
        case 20
          currentTime = roundTime;
        end
      
      % Housekeeping, done every so often
      if (mod(iteration, collectSampleStep)==0) 
        [allPfs, pfLocations] = removeEmptyCells(allPfs, pfLocations, currentTime, roundTime); % Empties data from PFs that disintegrated over time
        Outputs = updateOutputs(Outputs, Subunits, allPfs, pfLocations, currentTime, gdpOffCount); % Saves output data
        if popup
          waitbar(currentTime./roundTime, waitPopup, 'Running experiment...');
        end
      end
      currentTime = currentTime + tau; % Iterate by time step
      iteration = iteration + 1; % Keep track of current iteration
    end
    if (roundCount==1 && Parameters.mixPFs==1)
      allPfs = mixPfs(allPfs); % Mixes assembled PFs if doing mixing experiment
    end
    if (roundCount==1 && Parameters.disassemblePfs==1)
      Kinetics.kbongtp = Kinetics.kbongtp./100;
      Kinetics.kbongdp = Kinetics.kbongdp./100;
      Kinetics.ktongtp = Kinetics.ktongtp./100;
      Kinetics.ktongdp = Kinetics.ktongdp./100;
    end
    roundCount = roundCount + 1; % Iterates round count. Used if pre-assembling PFs for mixing
  end
  if popup
    close(waitPopup);
  end
end

