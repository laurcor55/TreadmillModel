function allPfs = hydrolysis(allPfs)
  totalGTP = 0;
  GTPinPF = countPfGtp(allPfs);
  
  totalGTP = sum(GTPinPF);
  normalizedGTPinPF = GTPinPF./totalGTP;
  sumNormGTPinPF = cumsum(normalizedGTPinPF);

  r = rand;
  lessThanInd = find(r<sumNormGTPinPF);
  switchPF = lessThanInd(1);
  indPF = allPfs{switchPF}(2:end);
  top = allPfs{switchPF}(1);
  bottom = allPfs{switchPF}(end);
  GTPind = [find(indPF == 2); find(indPF == 4); find(indPF == 6)];
  switchSubunit = ceil(rand.*(length(GTPind)));
  indPF(GTPind(switchSubunit)) = indPF(GTPind(switchSubunit))-1;
  allPfs{switchPF} = [top; indPF];
end
