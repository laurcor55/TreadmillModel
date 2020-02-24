classdef outputs
   properties
      monomerConc
      pfFtszConc
      capMonomerConc
      capDimerConc

      hydrolysisCount

      savePfs
      saveLocations
      time
   end

   methods 
      function Outputs = outputs(allPfs, pfLocations, Subunits)
         pfFtsZ = 0;
         for ii=1:length(allPfs)
            for jj = 1:length(allPfs{ii})
               allPfs{ii};
               pfFtsZ = pfFtsZ  + sum(allPfs{ii}(jj)<5) - sum(allPfs{ii}(jj)==5);
            end
         end

         Outputs.monomerConc = [num2conc(Subunits.monomerNum+Subunits.gdpMonomerNum+Subunits.highMonomerNum)];
         Outputs.capMonomerConc = [num2conc(Subunits.capMonomerNum)];
         Outputs.capDimerConc = [num2conc(Subunits.capDimerNum)];
         Outputs.pfFtszConc = [num2conc(pfFtsZ)];

         Outputs.hydrolysisCount = [0];

         Outputs.time = [0];

         Outputs.savePfs{1} = allPfs;
         Outputs.saveLocations{1} = pfLocations;
      end

      function Outputs = updateOutputs(Outputs, Subunits, allPfs, allPFLocation, currentTime, hydrolysisCount)
         pfFtsZ = 0;

         for ii=1:length(allPfs)
            pfFtsZ = pfFtsZ + sum(allPfs{ii}>0);
         end


         Outputs.monomerConc = [Outputs.monomerConc, num2conc(Subunits.monomerNum+Subunits.gdpMonomerNum+Subunits.highMonomerNum)];
         Outputs.capMonomerConc = [Outputs.capMonomerConc, num2conc(Subunits.capMonomerNum)];
         Outputs.capDimerConc = [Outputs.capDimerConc, num2conc(Subunits.capDimerNum)];
         Outputs.pfFtszConc = [Outputs.pfFtszConc, num2conc(pfFtsZ)];


         Outputs.hydrolysisCount = [Outputs.hydrolysisCount, hydrolysisCount];

         [~, saveIndex]=size(Outputs.monomerConc);
         Outputs.savePfs{saveIndex} = allPfs;
         Outputs.saveLocations{saveIndex} = allPFLocation;

         Outputs.time = [Outputs.time, currentTime];
      end
   end
end
