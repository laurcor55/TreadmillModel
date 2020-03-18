% Counts total hydrolyzable GTP in each PF

function pfGdp = countPfGdp(allPFs)
  pfGdp = zeros(size(allPFs));
  for ii=1:length(allPFs)
    pf = allPFs{ii};
    if length(pf)>1
      innerPf = pf(3:end-1);
      pfGdp(ii) = sum(innerPf==1 | innerPf==3 | innerPf==5);
    end
  end
end