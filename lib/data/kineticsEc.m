function Kinetics = kineticsEc()
  Kinetics.kbongtp = 10;
  Kinetics.kboffgtp = 3;

  Kinetics.kbongdp = 10;
  Kinetics.kboffgdp = 100;

  Kinetics.ktongdp = 0.1; 
  Kinetics.ktoffgdp = 7.5;

  Kinetics.ktongtp = 1;
  Kinetics.ktoffgtp = 0.3;      

  Kinetics.capKd = 0.78;
  Kinetics.kcaponpf = 0;
  Kinetics.kcapoffpf = 3; 
  Kinetics.kcapoffpfgdp = 100;

  Kinetics.indGtpaseRate = 0.4;
  Kinetics.kgdpexchange = 1;
  Kinetics.kswitch = 5000;
end