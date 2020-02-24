function h = topOffGdpPenultimate_test
  


  possiblePFs = [2, 4, 10];
  observed = zeros(size(possiblePFs));

  for repeat = 1:100
    allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 2; 6],[2; 2; 1; 2; 4; 2; 5], [4; 5], [4; 6]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = int8(allPFsBefore{ii});
    end

    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;

    gdpOffCount = 0;

    [allPFsAfter, Subunits, gdpOffCount] = topOffGdpPenultimate(allPFsBefore, Subunits, gdpOffCount);

    differences = 0;

    for ii=1:length(allPFsBefore)
      if (sum(allPFsBefore{ii})~= sum(allPFsAfter{ii}))
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert(any(possiblePFs(:)==ii));
        differences = differences + 1;
       
        if (ii==2 || ii==4)
          assert(length(allPFsBefore{ii}) == length(allPFsAfter{ii})+1);
          assert(allPFsAfter{ii}(1)==allPFsBefore{ii}(2));
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 11);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 10);
        
        else
          assert(sum(allPFsAfter{ii})==0);
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 11);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 11);
        end
        if (ii==4 || ii==10)
          assert(gdpOffCount==1)
        elseif (ii==5)
          assert(gdpOffCount==0)
          
        end
      end
    end

    assert(differences == 1);
  end


  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
    
end