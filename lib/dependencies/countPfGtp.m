% Counts total hydrolyzable GTP in each PF

function GTPinPF = countPfGtp(allPFs)
  GTPinPF = zeros(size(allPFs));
  for ii=1:length(allPFs)
    pf = allPFs{ii};
    if length(pf)>1
      innerPf = pf(2:end);
      GTPinPF(ii) = sum(innerPf==2 | innerPf==4 | innerPf==6);
    end
  end
end