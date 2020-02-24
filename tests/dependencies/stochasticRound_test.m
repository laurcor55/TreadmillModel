
num = 0.2;
result = zeros(1,2);
for ii=1:100
  numRound= stochasticRound(num);
  if numRound == 0
    result(1) = result(1) + 1;
  elseif numRound == 1
    result(2) = result(2) + 1;
  end
end
assert(chi2gof(result, 'Expected', [80 20], 'NParams', 100)==0);