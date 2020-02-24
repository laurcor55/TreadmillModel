clear all;
close all;



allPFs{1} = {[1], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[1; 2; 2; 2; 2; 2]};
allPFs{2} = {[1; 5], [2; 3; 1; 2], [2], [1; 1; 5], [0],[],[1; 2; 2; 2; 2; 2], [2], [2], [2], [2], [2], [2], [2; 2; 2]};


difference = 0;

allPFLocation{1} = zeros(size(allPFs{1}));
allPFLocation{1}(2) = -2;
allPFLocation{1}(4) = 5;


allPFLocation{2} = zeros(size(allPFs{2}));
allPFLocation{2}(2) = -3;
allPFLocation{2}(4) = 5;


matrixPFSnapshots = cellsTo3DMatrix(allPFs,allPFLocation);

matrixPFSnapshotsGuess1 = [0     0     0     0     0     0     0     0     0     0     0     0     0     0
0     2     0     0     0     0     1     0     0     0     0     0     0     0
0     3     0     0     0     0     2     0     0     0     0     0     0     0
0     1     0     0     0     0     2     0     0     0     0     0     0     0
0     2     0     0     0     0     2     0     0     0     0     0     0     0
0     0     0     0     0     0     2     0     0     0     0     0     0     0
0     0     0     0     0     0     2     0     0     0     0     0     0     0
0     0     0     0     0     0     0     0     0     0     0     0     0     0
0     0     0     0     0     0     0     0     0     0     0     0     0     0
0     0     0     1     0     0     0     0     0     0     0     0     0     0
0     0     0     1     0     0     0     0     0     0     0     0     0     0
0     0     0     5     0     0     0     0     0     0     0     0     0     0];



matrixPFSnapshotsGuess2 = [     0     2     0     0     0     0     0     0     0     0     0     0     0     0
     0     3     0     0     0     0     1     0     0     0     0     0     0     0
     0     1     0     0     0     0     2     0     0     0     0     0     0     0
     0     2     0     0     0     0     2     0     0     0     0     0     0     0
     0     0     0     0     0     0     2     0     0     0     0     0     0     2
     1     0     0     0     0     0     2     0     0     0     0     0     0     2
     5     0     0     0     0     0     2     0     0     0     0     0     0     2
     0     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     0     1     0     0     0     0     0     0     0     0     0     0
     0     0     0     1     0     0     0     0     0     0     0     0     0     0
     0     0     0     5     0     0     0     0     0     0     0     0     0     0];

for ii=1:14
  for jj=1:12
    if (matrixPFSnapshotsGuess1(jj,ii)~=matrixPFSnapshots(jj,ii,1))
      difference = difference + 1;
    end
  end
end

for ii=1:14
  for jj=1:12
    if (matrixPFSnapshotsGuess2(jj,ii)~=matrixPFSnapshots(jj,ii,2))
      difference = difference + 1;
    end
  end
end

assert(difference==0);

