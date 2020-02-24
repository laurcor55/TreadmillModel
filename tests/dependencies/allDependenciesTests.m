modelDependenciesFiles = dir('../../lib/dependencies');

folderCell = struct2cell(modelDependenciesFiles);
dependencies = {};

for ii=3:length(modelDependenciesFiles)
  dependencies{ii-2} = folderCell{1,ii};
  dependencies{ii-2} = strcat(dependencies{ii-2}(1:end-2), '_test.m');
end

folderCell = struct2cell(dir);
dependencies_test = {};

for ii=3:length(dir)
  dependencies_test{ii-2} = folderCell{1,ii};
end

fprintf('Missing Tests:\n');

for ii=1:length(dependencies)
  found = 0;
  for jj=1:length(dependencies_test)
    if (sum(dependencies_test{jj})==sum(dependencies{ii}))
      found = 1;
    end
  end
  if (found==0)
    fprintf('\t%s\n',dependencies{ii})
  end
end
fprintf('\n');

fprintf('Running dependencies tests...\n')

for ii=1:2
  fprintf('iteration %d\n',ii)
  
  countCapBottom_test;
  countFtszBottom_test;
  countPenultimate_test;
  countPfGtp_test;

  gtpColorAssign_test;
  isPf_test;

  removeEmptyCells_test;
  removeShortPf_test;

  stochasticRound_test;
end

fprintf('All tests passed.\n')

%matrix = cellsTo3DMatrix({allPFsBefore, allPFsAfter},{zeros(size(allPFsBefore)), zeros(size(allPFsAfter))})
