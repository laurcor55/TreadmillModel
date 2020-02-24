function h = topOnGtpPenultimate_test

  possiblePFs = [7, 8, 9];
  observed = zeros(size(possiblePFs));

  for repeat = 1:100

    allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[2; 2; 2; 4; 2; 2],[1; 4; 5], [1; 6]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = uint8(allPFsBefore{ii});
    end


    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;

    GTPchoice = 2;

    [allPFsAfter, Subunits] = topOnGtpPenultimate(allPFsBefore, Subunits, GTPchoice);

    goodDifferences = 0;
    badDifferences = 0;


    for ii=1:length(allPFsBefore)
      if (sum(allPFsBefore{ii}) ~= sum(allPFsAfter{ii}))
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert(any(possiblePFs(:)==ii));
        if ((allPFsAfter{ii}(1)==GTPchoice) && any(possiblePFs(:)==ii))
          goodDifferences = goodDifferences + 1;
        else
          badDifferences = badDifferences + 1;
          break;
        end
      end
    end


    assert(Subunits.gdpMonomerNum == 10);
    assert(Subunits.monomerNum == 9);
    assert(Subunits.capDimerNum == 10);
    assert(Subunits.capMonomerNum == 10);

    assert(badDifferences == 0);

  end

  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
    
end