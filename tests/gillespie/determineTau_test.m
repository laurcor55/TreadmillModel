Kinetics.kbongtp = 10;
Kinetics.kboffgtp = 9;

Kinetics.kbongdp = 14;
Kinetics.kboffgdp = 15;

Kinetics.ktongdp = 3;
Kinetics.ktoffgdp = 8;
Kinetics.ktongtp = 4;
Kinetics.ktoffgtp = 0.1;

Kinetics.capKd = 13;
Kinetics.kcaponpf = 5.3;
Kinetics.kcapoffpf = 2;
Kinetics.kcapoffpfgdp = 4;




Kinetics.khyd = 0.5;
Kinetics.kgdpexchange= 5;
Kinetics.knuc = 5000;

allPFs = {[1], [2; 3; 1; 2], [2], [1; 2; 5], [1; 4], [4; 5], [0],[],[2; 2; 2; 2; 2; 2], [2; 3; 1; 2; 1],[5], [2; 3; 1; 2; 1; 6], [1; 6], [1; 5]};

Subunits.capDimerNum = 5;
Subunits.capMonomerNum = 6;
Subunits.gdpMonomerNum = 7;
Subunits.monomerNum = 8;

[allProbs, tau] = determineTau(Subunits, allPFs, Kinetics);

allProbsGoal = zeros(1, 14);

allProbsGoal(1) = 2.*2; % Cap dimer off pf
allProbsGoal(2) = 3.*5.*secondOrderConverter(5.3); % Cap dimer on pf

allProbsGoal(3) = 3.*9; % bottom off GTP
allProbsGoal(4) = 3.*8.*secondOrderConverter(10); % Bottom on GTP



allProbsGoal(5) = 7.*5; % GDP exchange monomer

allProbsGoal(6) = 12.*0.5; % GTPase
allProbsGoal(7) = 8/(1+5000).*8.*secondOrderConverter(10+4); % Nucleation

allProbsGoal(8) = 5.*8; % Top off GDP penultimate
allProbsGoal(9) = 4.*0.1; % Top off GTP penultimate
allProbsGoal(10) = 5.*8.*secondOrderConverter(3); % Top on GDP penultimate
allProbsGoal(11) = 4.*8.*secondOrderConverter(4); % Top on GTP penultimate

allProbsGoal(12) = 8/(1+5000).*5.*secondOrderConverter(5.3); % Nucleation with Cap:FtsZ dimer

allProbsGoal(13) = 1.*15; % bottom off GDP
allProbsGoal(14) = 1.*8.*secondOrderConverter(14); % Bottom on GDP

allProbsGoal(15) = 4.*3;
allProbsGoal(16) = 8.*5./(1+5000).*secondOrderConverter(4);

for ii=1:length(allProbs)
   assert(abs(allProbs(ii)-allProbsGoal(ii))<0.00001)
end
