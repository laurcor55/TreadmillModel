function h = chiSquared(observed, expected, alpha)

  chi2 = 0;
  for ii=1:length(observed)
    chi2 = chi2 + (observed(ii)-expected(ii)).^2./expected(ii);
  end

  pvalue = 1-chi2cdf(chi2, length(expected)-1);

  if (pvalue>alpha)
    h = 0; %%Categories are the same distribution
  else
    h = 1; %%Categoreis are different distributions
  end

end
