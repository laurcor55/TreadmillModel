function h = anneal_test
  allPFsBefore = {[1], [2; 3; 1; 1], [2], [1; 4; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 3], [2; 1], [4; 2]};

  possibleBottom = [4, 7, 8, 10];
  
  possibleTop = [7, 10];
  observedBottom = zeros(size(possibleBottom));
  observedTop = zeros(size(possibleTop));

  for repeat = 1:100

    pfBottomFound = 0;
    pfTopFound = 0;
    [allPFsAfter] = anneal(allPFsBefore);

    for ii=1:length(allPFsAfter)
      if (sum(allPFsBefore{ii})~= sum(allPFsAfter{ii}))
        
        if sum(allPFsAfter{ii})==0 && sum(allPFsBefore{ii})>0
          % ii is the PF bottom
          pfBottomFound = pfBottomFound + 1;
          [~, pfInd] = find(possibleBottom==ii);
          observedBottom(pfInd) = observedBottom(pfInd) + 1;

        elseif sum(allPFsAfter{ii})>0
          % ii is the PF top
          pfTopFound = pfTopFound + 1;
          [~, pfInd] = find(possibleTop==ii);
          
          observedTop(pfInd) = observedTop(pfInd) + 1;
        end

      end
    end

    assert(pfBottomFound==1);
    assert(pfTopFound==1);

  end

  expectedTop = [50, 50];
  expectedBottom = [2, 1, 2, 1]./6.*100;
  h = chiSquared(observedBottom, expectedBottom, 0.05)
  h = h + chiSquared(observedTop, expectedTop, 0.05)
  h = h./2;
end
