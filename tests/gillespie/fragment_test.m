function h = fragment_test
  allPfsBefore = {[1], [2; 3; 1; 1], [2], [1; 4; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 3], [2; 1], [4; 2]};

  pfLocationsBefore = [1:length(allPfsBefore)];

  possiblePf = [2, 7, 8];
  observedPf = zeros(size(possiblePf));

  for repeat = 1:100

    pfFound = 0;
    [allPfsAfter, pfLocationsAfter] = fragment(allPfsBefore, pfLocationsBefore);

    for ii=1:length(allPfsBefore)
      if (sum(allPfsBefore{ii})~= sum(allPfsAfter{ii}))
        pfFound = pfFound + 1;
      
        [~, pfInd] = find(possiblePf==ii);
        observedPf(pfInd) = observedPf(pfInd) + 1;
        assert(sum([allPfsAfter{ii}; allPfsAfter{end}]) == sum(allPfsBefore{ii}));
      end
      assert(pfLocationsAfter(ii) == pfLocationsBefore(ii));
    end
    assert(pfFound==1);
    assert(pfLocationsAfter(ii+1)==0);

  end

  expectedPf = ones(1, length(possiblePf)).*100./length(possiblePf);
  h = chiSquared(observedPf, expectedPf, 0.05);
end
