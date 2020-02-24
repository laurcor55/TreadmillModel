

allProbs = [10 2 100 3 4 0 0];
outcome = eventChosenChiTest(allProbs);

allProbs = [0 18 32 5 8 0 9 42];
outcome = eventChosenChiTest(allProbs);


function outcome = eventChosenChiTest(allProbs)
  repeats = 100;
  eventCount=zeros(size(allProbs));
  for ii=1:repeats
    eventChosen = determineEvent(allProbs);
    eventCount(eventChosen) = eventCount(eventChosen) +1;
  end

  for ii=1:length(allProbs)
    if(allProbs(ii)==0)
      assert(eventCount(ii)==0)
    end
  end

  nonZeroInd = (allProbs~=0);
  allProbs = allProbs(nonZeroInd);
  eventCount = eventCount(nonZeroInd);
  outcome = chi2gof(eventCount, 'Expected',allProbs,'NParams',repeats);
  
  assert(outcome==0);
end
