function h = anneal_test
  allPFsBefore = {[1], [2; 3; 1; 1], [2], [1; 4; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 3], [2; 1], [4; 2]};

  possibleBottom = [4, 7, 8, 10];
  possibleTop = [7, 10];

  actualBottom = zeros(size(possibleBottom));
  actualTop = zeros(size(possibleTop));

  for repeat = 1:100

    pfBottomFound = 0;
    pfTopFound = 0;
    [allPFsAfter] = anneal(allPFsBefore);

    for ii=1:length(allPFsAfter)
      if (sum(allPFsBefore{ii})~= sum(allPFsAfter{ii}))
        
        if sum(allPFsAfter{ii})==0 && sum(allPFsBefore{ii})>0
          removedIndex = ii;
          pf1 = allPFsBefore{removedIndex};
        elseif sum(allPFsAfter{ii})>0
          annealedIndex = ii;
          pf2 = allPFsBefore{annealedIndex};
        end
      end
    end
    if sum(allPFsAfter{annealedIndex}(1:length(pf2)) == pf2) == length(pf2)
      [~, ind] = find(possibleBottom==removedIndex);
      actualBottom(ind) = actualBottom(ind) + 1;
      [~, ind] = find(possibleTop==annealedIndex);
      actualTop(ind) = actualTop(ind) + 1;
    else
      [~, ind] = find(possibleBottom==annealedIndex);
      actualBottom(ind) = actualBottom(ind) + 1;
      [~, ind] = find(possibleTop==removedIndex);
      actualTop(ind) = actualTop(ind) + 1;
    end
  end
  expectedBottom = ones(size(possibleBottom)).*100./length(possibleBottom);
  expectedTop = ones(size(possibleTop)).*100./length(possibleTop);

  h = chiSquared(actualBottom, expectedBottom, 0.05);
  h = h + chiSquared(actualTop, expectedTop, 0.05);
  h = h./2;
end
