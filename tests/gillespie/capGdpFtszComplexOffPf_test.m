function h = capGdpFtszComplexOffPf_test


  possiblePFs = [4, 9, 10, 12];
  observed = zeros(size(possiblePFs));


  for repeat = 1:100

    allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 2; 6],[2; 2; 1; 2; 4; 2; 5], [4; 5], [3; 6], [3; 5]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = int8(allPFsBefore{ii});
    end

    gdpOffCount = 4;
    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;

    pfLocations = zeros(1,length(allPFsBefore));

    [allPFsAfter, Subunits, pfLocations, gdpOffCount] = capGdpFtszComplexOffPf(allPFsBefore, Subunits, pfLocations, gdpOffCount);

    goodDifferences = 0;
    badDifferences = 0;

    for ii=1:length(allPFsBefore)
      
      if (sum(allPFsBefore{ii}) ~= sum(allPFsAfter{ii}))
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert(pfLocations(ii)==-1);

        assert(any(possiblePFs(:)==ii));
        assert(Subunits.capMonomerNum == 11);

        if (ii==4)
          assert(Subunits.monomerNum == 11);
          assert(sum(allPFsAfter{ii})==sum(allPFsBefore{ii}(1:end-1)));
          assert(gdpOffCount==5);
        elseif (ii==10)
          assert(allPFsAfter{ii} == 0);
          assert(Subunits.monomerNum == 12);
          assert(gdpOffCount==5);
        elseif (ii==12)
          assert(allPFsAfter{ii} == 0);
          assert(Subunits.monomerNum == 12);
          assert(gdpOffCount==6);
        end

      end
    end
    assert(Subunits.capDimerNum == 10);
    assert(sum(pfLocations)==-1);
  end

  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
end