
currentPFSet = 1;
GTP = zeros(1, 100);
for ii=1:100
  GTP(ii) = gtpColorAssign(currentPFSet);
end
assert(length(find(GTP~=2))==0);

currentPFSet = 2;
GTP = zeros(1, 1);
GTPCount = zeros(1,2);
for ii=1:100
  GTP(ii) = gtpColorAssign(currentPFSet);
  if (GTP==2)
    GTPCount(1) = GTPCount(1)+1;
  elseif (GTP==4)
    GTPCount(2) = GTPCount(2)+2;
  end
end
result = chi2gof(GTPCount, 'Expected', [50,50],'NParams', 100);
assert(result == 0);

currentPFSet = 3;
GTP = zeros(1, 1);
GTPCount = zeros(1,2);
for ii=1:100
  GTP(ii) = gtpColorAssign(currentPFSet);
  if (GTP==2)
    GTPCount(1) = GTPCount(1)+1;
  elseif (GTP==4)
    GTPCount(2) = GTPCount(2)+2;
  end
end
result = chi2gof(GTPCount, 'Expected', [50,50],'NParams', 100);
assert(result == 0);