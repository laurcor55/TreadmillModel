addpath('../lib');
addpath('../lib/data', '../lib/dependencies', '../lib/gillespie');


Kinetics = kinetics();

Parameters = parameters();
  Parameters.totalTime = 60;
  Parameters.concTotalFtsZ = 3;
  Parameters.concCap = 1;
  Parameters.mixPFs = 0;

ftszBefore = round(conc2num(Parameters.concTotalFtsZ));
capBefore = round(conc2num(Parameters.concCap));

Outputs = runExperiment(Parameters, Kinetics, false);

allPfs = Outputs.savePfs{end};
capBottom = 0;
pfFtsz = 0;
for ii=1:length(allPfs)
  if (allPfs{ii}(end)>4)
    capBottom = capBottom + 1;
  end
  pfFtsz = pfFtsz + sum((allPfs{ii}>0));
end

ftszAfter = pfFtsz + conc2num(Outputs.monomerConc(end)) + conc2num(Outputs.capDimerConc(end));
capAfter = capBottom + conc2num(Outputs.capDimerConc(end) + Outputs.capMonomerConc(end));

conc2num(Outputs.pfFtszConc(end));

assert(abs(conc2num(Outputs.pfFtszConc(end))-pfFtsz)<2)
assert(abs(ftszAfter-ftszBefore)<2)
assert(abs(capBefore-capAfter)<2)