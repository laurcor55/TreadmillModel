function h = hydrolysis_test


  observed = zeros(1, 20);
  expected = zeros(1, 20);
  possiblePFs = [2, 4, 7, 8, 9];
  gtpInd = [4, 8, 12, 14, 15, 16, 18, 20];
  repeats = 100;
  expected(gtpInd) = repeats./length(gtpInd);
  rng('shuffle')

  for repeat = 1:repeats
    allPFsBefore = {[1], [2; 3; 4; 1], [2], [1; 2; 5], [0],[],[2; 2; 1; 2; 4; 2], [2; 4], [1; 6]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = uint8(allPFsBefore{ii});
    end

    allPFsAfter = hydrolysis(allPFsBefore);

    goodDifferences = 0;
    badDifferences = 0;

    subunitIndex = 1;

    for ii=1:length(allPFsBefore)
      for jj=1:length(allPFsBefore{ii})
        if (allPFsBefore{ii}(jj)~=allPFsAfter{ii}(jj))
          observed(subunitIndex) = observed(subunitIndex) + 1;
          assert(any(possiblePFs(:)==ii));
          if (mod(allPFsBefore{ii}(jj), 2)==0) && allPFsAfter{ii}(jj) == allPFsBefore{ii}(jj) - 1
            goodDifferences = goodDifferences + 1;
          else
            badDifferences = badDifferences + 1;
            allPFsBefore{ii}
            allPFsAfter{ii}
          end
        end
        subunitIndex = subunitIndex + 1;
      end
    end

    assert(goodDifferences == 1);
    assert(badDifferences == 0);

  end
  nonzeroIndObserved = observed==0;
  nonzeroIndExpected = expected==0;
  for ii=1:length(nonzeroIndExpected)
    assert(nonzeroIndExpected(ii)==nonzeroIndObserved(ii))
  end

  assert(sum(observed)==repeats)
  observed = observed(observed>0);
  expected = expected(expected>0);
  h = chiSquared(observed, expected, 0.05);
end



