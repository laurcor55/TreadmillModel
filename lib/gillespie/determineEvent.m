function eventChosen = determineEvent(allProbs);
  zeroInd = find(allProbs == 0);
  allProbs = cumsum(allProbs);
  allProbs = allProbs./(allProbs(end));
  allProbs(zeroInd) = 0;
  eventChosen = find(allProbs > rand, 1, 'first');
  if (isempty(eventChosen))
    eventChosen = 20;
  end
end
