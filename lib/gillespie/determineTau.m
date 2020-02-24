function [allProbs, tau, Subunits] = determineTau(Subunits, allPfs, Kinetics);
  Subunits = capEquilibrium(Subunits, Kinetics);
  
  
  totalGTPinPF = sum(countPfGtp(allPfs));
  [gdpPenultimateInd, gtpPenultimateInd] = countPenultimate(allPfs);
  [gdpBottomInd, gtpBottomInd] = countFtszBottom(allPfs);

  gdpBottomNum = length(gdpBottomInd);
  gtpBottomNum = length(gtpBottomInd);
  ftszBottomNum = gtpBottomNum + gdpBottomNum;
  gdpPenultimateNum = length(gdpPenultimateInd);
  gtpPenultimateNum = length(gtpPenultimateInd);

  pfNum = gdpPenultimateNum + gtpPenultimateNum;
  
  [gdpCapBottomInd, gtpCapBottomInd] = countCapBottom(allPfs);
  gdpCapBottomNum = length(gdpCapBottomInd);
  gtpCapBottomNum = length(gtpCapBottomInd);

  capBottomNum = gdpCapBottomNum + gtpCapBottomNum;

  totalReactions = 16;
  reactant1 = zeros(1,totalReactions);
  reactant2 = zeros(1, totalReactions);
  kinetic = zeros(1, totalReactions);

  % Cap-FtsZ off bottom of PF
  num = 1;
  reactant1(num) = gtpCapBottomNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.kcapoffpf;

  % Cap-FtsZ on bottom of PF
  num = 2;
  reactant1(num) = Subunits.capDimerNum;
  reactant2(num) = gtpBottomNum;
  kinetic(num) =  secondOrderConverter(Kinetics.kcaponpf);


  % Bottom off PF GTP
  num = 3;
  reactant1(num) = gtpBottomNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.kboffgtp;

  % Bottom on PF GTP
  num = 4;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) = gtpBottomNum;
  kinetic(num) = secondOrderConverter(Kinetics.kbongtp);

  % Exchange GDP on monomer for GTP
  num = 5;
  reactant1(num) = Subunits.gdpMonomerNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.kgdpexchange;

  % GTP hydrolysis in PF
  num = 6;
  reactant1(num) = totalGTPinPF;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.indGtpaseRate;

  % Nucleate new PF
  num = 7;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) =  Subunits.monomerNum./(1+Kinetics.kswitch); %%%%% CHANGE HERE %%%%%%
  kinetic(num) = secondOrderConverter(Kinetics.kbongtp);

  % Top off PF with GDP penultimate
  num = 8;
  reactant1(num) = gdpPenultimateNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.ktoffgdp;

  % Top off PF with GTP penultimate
  num = 9;
  reactant1(num) = gtpPenultimateNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.ktoffgtp;

  % Top on PF with GDP penultimate
  num = 10;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) = gdpPenultimateNum;
  kinetic(num) =  secondOrderConverter(Kinetics.ktongdp);

  % Top on PF with GTP penultimate
  num = 11;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) = gtpPenultimateNum;
  kinetic(num) =  secondOrderConverter(Kinetics.ktongtp);

  % Nucleate new PF with MciZ dimer
  num = 12;
  reactant1(num) = Subunits.capDimerNum;
  reactant2(num) =  Subunits.monomerNum/(1+Kinetics.kswitch); %%%%% CHANGE HERE %%%%%%
  kinetic(num) = secondOrderConverter(Kinetics.kcaponpf);

  % Bottom off PF GDP
  num = 13;
  reactant1(num) = gdpBottomNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.kboffgdp;

  % Bottom on PF 
  num = 14;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) = gdpBottomNum;
  kinetic(num) = secondOrderConverter(Kinetics.kbongdp);

  % Cap-FtsZ off bottom of PF
  num = 15;
  reactant1(num) = gdpCapBottomNum;
  reactant2(num) = 1;
  kinetic(num) = Kinetics.kcapoffpfgdp;

  % Nucleate new PF with MciZ dimer high affinity
  num = 16;
  reactant1(num) = Subunits.monomerNum;
  reactant2(num) =  Subunits.capDimerNum/(1+Kinetics.kswitch); %%%%% CHANGE HERE %%%%%%
  kinetic(num) =  secondOrderConverter(Kinetics.ktongtp);

  allProbs = reactant1.*reactant2.*kinetic;

  tau = 1/sum(allProbs).*log(1/rand);

end
