function h = bottomOffGdp_test

  possiblePFs = [1 7];
  observed = zeros(size(possiblePFs));

  for repeat = 1:100

    allPFsBefore = {[1; 4], [2; 3; 1; 1], [2; 2; 5], [1; 1; 1; 5], [0],[],[2; 2; 1; 2; 4; 2], [4; 3; 2; 3], [4; 3; 2; 6], [1], [2; 3], [3; 1]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = int8(allPFsBefore{ii});
    end
    gdpOffCount = 5;

    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;
    Subunits.highMonomerNum = 10;

    pfLocations = zeros(1,length(allPFsBefore));

    [allPFsAfter,Subunits, pfLocations, gdpOffCount] = bottomOffGtp(allPFsBefore,Subunits, pfLocations, gdpOffCount);

    differences = 0;
    for ii=1:length(allPFsBefore)
      if (length(allPFsBefore{ii})~= length(allPFsAfter{ii}))
        differences = differences + 1;
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert(any(possiblePFs(:)==ii));
        assert(pfLocations(ii)==-1);
        assert(sum(pfLocations)==-1);
        
        assert(Subunits.capMonomerNum == 10);
        assert(Subunits.highMonomerNum == 10);
      
        assert(length(allPFsBefore{ii})== length(allPFsAfter{ii})+1);
        assert(Subunits.gdpMonomerNum == 10);
        assert(Subunits.capDimerNum == 10);
        if (ii==2 | ii==8)
          assert(gdpOffCount==6);
          assert(Subunits.monomerNum == 11); 
        elseif (ii==12)
          assert(gdpOffCount==7);
          assert(Subunits.monomerNum == 12); 
          assert(allPFsAfter{ii}==0);
        elseif (ii==11)
          assert(gdpOffCount==6);
          assert(Subunits.monomerNum == 12); 
          assert(allPFsAfter{ii}==0); 
        end
        if (ii<11 & ii>1)
          assert(allPFsAfter{ii}(end)==allPFsBefore{ii}(end-1));
        end
      
      end
    end
    assert(differences == 1);
  end

  
  
  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
end