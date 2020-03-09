

allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 1], [0],[], [2; 2; 1; 2; 4; 2]};
for ii = 1:length(allPFsBefore)
  allPFsBefore{ii} = uint8(allPFsBefore{ii});
end


Subunits.capDimerNum = 10;
Subunits.capMonomerNum = 10;
Subunits.gdpMonomerNum = 10;
Subunits.monomerNum = 10;
Subunits.highMonomerNum = 10;

allPFLocationBefore = zeros(size(allPFsBefore));
GTPchoice = 4;

[allPFsAfter,allPFLocationAfter,Subunits] = nucleationCap(allPFsBefore,allPFLocationBefore,Subunits, GTPchoice);

goodDifferences = 0;
badDifferences = 0;

for ii=1:length(allPFsBefore)
  if (allPFsBefore{ii}~= allPFsAfter{ii})
    badDifferences = badDifferences + 1;
    break;
  end
end
if (allPFsAfter{end}~= [GTPchoice; 6])
  badDifferences = badDifferences + 1;
end

assert(sum(allPFLocationAfter)==0);
assert(length(allPFLocationAfter)==length(allPFLocationBefore)+1);


assert(Subunits.gdpMonomerNum == 10);
assert(Subunits.monomerNum == 9);
assert(Subunits.highMonomerNum == 10);
assert(Subunits.capDimerNum == 9);
assert(Subunits.capMonomerNum == 10);

assert(badDifferences == 0);
