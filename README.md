# TreadmillModel
TreadmillModel is a matlab program for FtsZ treadmilling, nucleation and GTP hydrolysis. At current development, users must install matlab to use application. 

## Installation and Use=
For users with access to matlab. 
1. Install matlab from [MathWorks](mathworks.com). Follow download instructions provided by installer. Skip this step if you already have matlab.
2. In web browser, visit [GitLab repository](https://github.com/laurcor55/TreadmillModel). Click 'Clone or Download' and 'Download Zip'. Unzip folder and move to Documents/MATLAB directory.
3. Open matlab and navigate to the TreadmillModel-master directory with either `cd TreadmillModel-master` or with the file path navigation bar. 
4. Run app by typing `RunApp` and enter command window. 

## Navigating App Input
User can supply numeric inputs for kinetics and parameters with input boxes on left side. To run model, click the green "Run" button at the bottom.

The app can be configured to simulate bottom cappers, PF mixing, and PF disassembly. 

### Add Bottom Cap
To add a bottom capper, click the gray 'Add Bottom Cap' button at the bottom left. In the popup, adjust the kinetic parameters and the concentration of capper with numeric inputs. Press apply and the green 'Run' button. 

To undo adding a bottom capper, click 'Add Bottom Cap', and input 0 for the 'Bottom Cap (uM)' numeric box. Click 'Apply'. Accept the warning message. Continue with app. 

### PF Mixing Experiment
To simulate PF mixing, click the gray 'PF Mixing Experiment' button. In the small popup, add a numeric time value in seconds. Click 'OK', then 'Run'. 

To undo adding a PF mixing experiment, click the 'PF Mixing Experiment' button, and click 'Cancel' in the popup. 

### PF Disassembly Experiment
To simulate PF mixing, click the gray 'PF Disassembly Experiment' button. In the small popup, add a numeric time value in seconds. Click 'OK', then 'Run'. 

To undo adding a PF disassembly experiment, click the 'PF Disassembly Experiment' button, and click 'Cancel' in the popup. 

### Navigating App Results
After running an experiment, the results appear in the two panels on the right side of the app. Users can play a video of the PFs at the top. Users can see summary plots and a table with the tabs at the bottom. 

To export results, click the blue 'Export' button on the bottom. Figures will be created and automatically close. To view these, open a web browser and paste the link provided in the popup. Save or print this as a normal web page. 
