function h = capFtszComplexOnPf_test


  possiblePFs = [2, 7, 8];
  observed = zeros(size(possiblePFs));


  for repeat = 1:100

    allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[2; 2; 1; 2; 4; 2], [1; 4]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = uint8(allPFsBefore{ii});
    end


    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;

    GTPchoice = 4;
    pfLocations = zeros(1,length(allPFsBefore));

    [allPFsAfter, Subunits, pfLocations] = capFtszComplexOnPf(allPFsBefore, Subunits, pfLocations);

    goodDifferences = 0;
    badDifferences = 0;

    for ii=1:length(allPFsBefore)
      if (sum(allPFsBefore{ii}) ~= sum(allPFsAfter{ii}))
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert((allPFsAfter{ii}(end)==6))
        assert(any(possiblePFs(:)==ii))
        assert(pfLocations(ii)==1);
      end
    end

    assert(Subunits.gdpMonomerNum == 10);
    assert(Subunits.monomerNum == 9);
    assert(Subunits.capDimerNum == 10);
    assert(Subunits.capMonomerNum == 9);

    assert(badDifferences == 0);
    assert(sum(pfLocations)==1);

  end


  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
end