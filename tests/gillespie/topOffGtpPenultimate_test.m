function h = topOffGtpPenultimate_test



  possiblePFs = [7, 8, 9, 11, 12];
  observed = zeros(size(possiblePFs));

  for repeat = 1:100
    allPFsBefore = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[2; 2; 1; 2; 4; 2],[2; 2; 1; 2; 4; 2; 6],[1; 2; 1; 2; 4; 2; 5], [4; 5], [4; 6], [1; 4]};
    for ii = 1:length(allPFsBefore)
      allPFsBefore{ii} = uint8(allPFsBefore{ii});
    end


    Subunits.capDimerNum = 10;
    Subunits.capMonomerNum = 10;
    Subunits.gdpMonomerNum = 10;
    Subunits.monomerNum = 10;


    gdpOffCount = 0;
    [allPFsAfter, Subunits, gdpOffCount] = topOffGtpPenultimate(allPFsBefore, Subunits, gdpOffCount);
    differences = 0;

    for ii=1:length(allPFsBefore)
      if (sum(allPFsBefore{ii})~= sum(allPFsAfter{ii}))
        differences = differences + 1;
        observed(find(possiblePFs==ii)) = observed(find(possiblePFs==ii)) + 1;
        assert(any(possiblePFs(:)==ii));
        if (ii<9)
          assert(length(allPFsBefore{ii}) == length(allPFsAfter{ii})+1);
          assert(allPFsAfter{ii}(1)==allPFsBefore{ii}(2));
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 11);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 10);
          assert(gdpOffCount==0);

        elseif (ii==9)
          assert(length(allPFsBefore{ii}) == length(allPFsAfter{ii})+1);
          assert(allPFsAfter{ii}(1)==allPFsBefore{ii}(2));
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 11);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 10);
          assert(gdpOffCount==1);
        elseif (ii==12)
          assert(length(allPFsBefore{ii}) == length(allPFsAfter{ii})+1);
          assert(sum(allPFsAfter{ii})==0);
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 12);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 10);
          assert(gdpOffCount==1);
        else
          assert(Subunits.gdpMonomerNum == 10);
          assert(Subunits.monomerNum == 11);
          assert(Subunits.capDimerNum == 10);
          assert(Subunits.capMonomerNum == 11);
          assert(sum(allPFsAfter{ii})==0);
          assert(gdpOffCount==0);

        end
      end
    end


    assert(differences == 1);
  end


  expected = ones(size(possiblePFs)).*100./length(possiblePFs);
  h = chiSquared(observed, expected, 0.05);
end