

modelDependenciesFiles = dir('/home/lauren/Documents/research/treadmilling-model/model/lib/gillespie');

folderCell = struct2cell(modelDependenciesFiles);
dependencies = {};

for ii=3:length(modelDependenciesFiles)
  dependencies{ii-2} = folderCell{1,ii};
  dependencies{ii-2} = strcat(dependencies{ii-2}(1:end-2), '_test.m');
end

folderCell = struct2cell(dir('/home/lauren/Documents/research/treadmilling-model/model/tests/gillespie'));
dependencies_test = {};

for ii=3:length(folderCell)
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

fprintf('Running Gillespie tests...\n')
h = zeros(1, 17);

samples = 100;

for ii=1:samples
  rng('shuffle')

  %fprintf('iteration %d\n',ii)

  h(16) = anneal_test + h(16);
  h(1) = bottomOffGtp_test + h(1);
  h(2) = bottomOffGdp_test + h(2);

  h(3) = bottomOnGtp_test + h(3);
  h(4) = bottomOnGdp_test + h(4);


  capEquilibrium_test;
  h(5) = capGtpFtszComplexOffPf_test + h(5);
  h(6) = capGdpFtszComplexOffPf_test + h(6);
  h(7) = capFtszComplexOnPf_test + h(7);

  determineEvent_test;
  determineTau_test;

  exchangeMonomerGdp_test;
  h(17) = fragment_test + h(17);


  h(10) = hydrolysis_test + h(10);
  nucleation_test;
  nucleationCap_test;
  h(12) = topOffGdpPenultimate_test + h(12);
  h(13) = topOffGtpPenultimate_test + h(13);
  h(14) = topOnGdpPenultimate_test + h(14);
  h(15) = topOnGtpPenultimate_test + h(15);
end

%h = h(h~=0);

expected = samples.*0.05;
for ii=1:length(h)
  if (h(ii)>(expected+2))
    fprintf('Check staticially questionable test: %d (%d of %d)\n', ii, h(ii), expected);
  end
end
fprintf('Tests complete.\n')

%matrix = cellsTo3DMatrix({allPFsBefore, allPFsAfter},{zeros(size(allPFsBefore)), zeros(size(allPFsAfter))})
