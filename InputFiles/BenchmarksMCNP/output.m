seed = 987809617;
pop = 200000;
Inactive_Cycles = 200;
Active_Cycles = 1000;
Total_CPU_Time = 9.01425E+03;
Total_Transport_Time = 9.01231E+03;
inactive_batchSize = 1;
batchSize = 1;
keff_IMP_PROD = [ 1.97555E+05,1.25896E+01];
keff_IMP_ABS = [ 1.78844E+05,1.27992E+01];
keff_SCATTER_PROD = [ 9.83674E+02,1.00389E+00];
keff_ANA_LEAK = [ 2.21283E+04,4.75366E+00];
keff_K_EFF = [ 9.87830E-01,4.58875E-05];
active_batchSize = 1;
active_keff_k_analog = [ 9.87678E-01,8.57256E-05];
active_fiss_Res = reshape([ 1.00000E+02,0.00000E+00],2,1);
active_flux_EnergyBounds = reshape([ 1.00000E-03,1.03356E-03,1.06825E-03,1.10410E-03,1.14116E-03,1.17946E-03,1.21905E-03,1.25996E-03,1.30225E-03,1.34596E-03,1.39113E-03,1.43782E-03,1.48608E-03,1.53595E-03,1.58750E-03,1.64078E-03,1.69585E-03,1.75277E-03,1.81160E-03,1.87240E-03,1.93524E-03,2.00019E-03,2.06733E-03,2.13671E-03,2.20842E-03,2.28254E-03,2.35915E-03,2.43833E-03,2.52017E-03,2.60475E-03,2.69217E-03,2.78253E-03,2.87592E-03,2.97244E-03,3.07220E-03,3.17532E-03,3.28189E-03,3.39204E-03,3.50588E-03,3.62355E-03,3.74516E-03,3.87086E-03,4.00078E-03,4.13505E-03,4.27383E-03,4.41728E-03,4.56553E-03,4.71876E-03,4.87714E-03,5.04082E-03,5.21001E-03,5.38487E-03,5.56560E-03,5.75239E-03,5.94546E-03,6.14500E-03,6.35125E-03,6.56441E-03,6.78473E-03,7.01244E-03,7.24780E-03,7.49105E-03,7.74247E-03,8.00233E-03,8.27091E-03,8.54850E-03,8.83541E-03,9.13195E-03,9.43844E-03,9.75522E-03,1.00826E-02,1.04210E-02,1.07708E-02,1.11323E-02,1.15059E-02,1.18921E-02,1.22912E-02,1.27037E-02,1.31301E-02,1.35708E-02,1.40262E-02,1.44970E-02,1.49836E-02,1.54864E-02,1.60062E-02,1.65434E-02,1.70987E-02,1.76725E-02,1.82657E-02,1.88787E-02,1.95123E-02,2.01672E-02,2.08441E-02,2.15437E-02,2.22667E-02,2.30140E-02,2.37864E-02,2.45848E-02,2.54099E-02,2.62627E-02,2.71442E-02,2.80552E-02,2.89968E-02,2.99700E-02,3.09759E-02,3.20155E-02,3.30900E-02,3.42006E-02,3.53485E-02,3.65349E-02,3.77611E-02,3.90284E-02,4.03383E-02,4.16922E-02,4.30915E-02,4.45377E-02,4.60325E-02,4.75775E-02,4.91743E-02,5.08247E-02,5.25306E-02,5.42936E-02,5.61158E-02,5.79992E-02,5.99458E-02,6.19578E-02,6.40372E-02,6.61865E-02,6.84079E-02,7.07038E-02,7.30768E-02,7.55295E-02,7.80644E-02,8.06845E-02,8.33924E-02,8.61913E-02,8.90841E-02,9.20740E-02,9.51642E-02,9.83582E-02,1.01659E-01,1.05071E-01,1.08598E-01,1.12243E-01,1.16010E-01,1.19903E-01,1.23928E-01,1.28087E-01,1.32386E-01,1.36829E-01,1.41421E-01,1.46168E-01,1.51074E-01,1.56144E-01,1.61385E-01,1.66801E-01,1.72399E-01,1.78186E-01,1.84166E-01,1.90347E-01,1.96735E-01,2.03338E-01,2.10163E-01,2.17217E-01,2.24507E-01,2.32042E-01,2.39830E-01,2.47879E-01,2.56199E-01,2.64797E-01,2.73685E-01,2.82870E-01,2.92364E-01,3.02176E-01,3.12318E-01,3.22800E-01,3.33634E-01,3.44832E-01,3.56406E-01,3.68367E-01,3.80731E-01,3.93509E-01,4.06716E-01,4.20367E-01,4.34475E-01,4.49057E-01,4.64129E-01,4.79706E-01,4.95806E-01,5.12447E-01,5.29646E-01,5.47422E-01,5.65795E-01,5.84785E-01,6.04412E-01,6.24697E-01,6.45664E-01,6.67334E-01,6.89731E-01,7.12880E-01,7.36806E-01,7.61535E-01,7.87094E-01,8.13511E-01,8.40815E-01,8.69035E-01,8.98202E-01,9.28348E-01,9.59505E-01,9.91709E-01,1.02499E+00,1.05939E+00,1.09495E+00,1.13170E+00,1.16968E+00,1.20894E+00,1.24952E+00,1.29145E+00,1.33480E+00,1.37960E+00,1.42590E+00,1.47376E+00,1.52322E+00,1.57434E+00,1.62718E+00,1.68179E+00,1.73824E+00,1.79658E+00,1.85688E+00,1.91920E+00,1.98361E+00,2.05019E+00,2.11899E+00,2.19011E+00,2.26362E+00,2.33959E+00,2.41811E+00,2.49927E+00,2.58315E+00,2.66985E+00,2.75946E+00,2.85207E+00,2.94780E+00,3.04673E+00,3.14899E+00,3.25468E+00,3.36391E+00,3.47681E+00,3.59350E+00,3.71411E+00,3.83877E+00,3.96761E+00,4.10077E+00,4.23840E+00,4.38065E+00,4.52768E+00,4.67964E+00,4.83670E+00,4.99903E+00,5.16681E+00,5.34022E+00,5.51945E+00,5.70470E+00,5.89617E+00,6.09406E+00,6.29859E+00,6.50998E+00,6.72848E+00,6.95430E+00,7.18770E+00,7.42894E+00,7.67828E+00,7.93598E+00,8.20233E+00,8.47762E+00,8.76215E+00,9.05623E+00,9.36018E+00,9.67434E+00,9.99903E+00,1.03346E+01,1.06815E+01,1.10400E+01,1.14105E+01,1.17935E+01,1.21893E+01,1.25984E+01,1.30212E+01,1.34583E+01,1.39099E+01,1.43768E+01,1.48593E+01,1.53580E+01,1.58735E+01,1.64063E+01,1.69569E+01,1.75260E+01,1.81142E+01,1.87222E+01,1.93505E+01,1.03356E-03,1.06825E-03,1.10410E-03,1.14116E-03,1.17946E-03,1.21905E-03,1.25996E-03,1.30225E-03,1.34596E-03,1.39113E-03,1.43782E-03,1.48608E-03,1.53595E-03,1.58750E-03,1.64078E-03,1.69585E-03,1.75277E-03,1.81160E-03,1.87240E-03,1.93524E-03,2.00019E-03,2.06733E-03,2.13671E-03,2.20842E-03,2.28254E-03,2.35915E-03,2.43833E-03,2.52017E-03,2.60475E-03,2.69217E-03,2.78253E-03,2.87592E-03,2.97244E-03,3.07220E-03,3.17532E-03,3.28189E-03,3.39204E-03,3.50588E-03,3.62355E-03,3.74516E-03,3.87086E-03,4.00078E-03,4.13505E-03,4.27383E-03,4.41728E-03,4.56553E-03,4.71876E-03,4.87714E-03,5.04082E-03,5.21001E-03,5.38487E-03,5.56560E-03,5.75239E-03,5.94546E-03,6.14500E-03,6.35125E-03,6.56441E-03,6.78473E-03,7.01244E-03,7.24780E-03,7.49105E-03,7.74247E-03,8.00233E-03,8.27091E-03,8.54850E-03,8.83541E-03,9.13195E-03,9.43844E-03,9.75522E-03,1.00826E-02,1.04210E-02,1.07708E-02,1.11323E-02,1.15059E-02,1.18921E-02,1.22912E-02,1.27037E-02,1.31301E-02,1.35708E-02,1.40262E-02,1.44970E-02,1.49836E-02,1.54864E-02,1.60062E-02,1.65434E-02,1.70987E-02,1.76725E-02,1.82657E-02,1.88787E-02,1.95123E-02,2.01672E-02,2.08441E-02,2.15437E-02,2.22667E-02,2.30140E-02,2.37864E-02,2.45848E-02,2.54099E-02,2.62627E-02,2.71442E-02,2.80552E-02,2.89968E-02,2.99700E-02,3.09759E-02,3.20155E-02,3.30900E-02,3.42006E-02,3.53485E-02,3.65349E-02,3.77611E-02,3.90284E-02,4.03383E-02,4.16922E-02,4.30915E-02,4.45377E-02,4.60325E-02,4.75775E-02,4.91743E-02,5.08247E-02,5.25306E-02,5.42936E-02,5.61158E-02,5.79992E-02,5.99458E-02,6.19578E-02,6.40372E-02,6.61865E-02,6.84079E-02,7.07038E-02,7.30768E-02,7.55295E-02,7.80644E-02,8.06845E-02,8.33924E-02,8.61913E-02,8.90841E-02,9.20740E-02,9.51642E-02,9.83582E-02,1.01659E-01,1.05071E-01,1.08598E-01,1.12243E-01,1.16010E-01,1.19903E-01,1.23928E-01,1.28087E-01,1.32386E-01,1.36829E-01,1.41421E-01,1.46168E-01,1.51074E-01,1.56144E-01,1.61385E-01,1.66801E-01,1.72399E-01,1.78186E-01,1.84166E-01,1.90347E-01,1.96735E-01,2.03338E-01,2.10163E-01,2.17217E-01,2.24507E-01,2.32042E-01,2.39830E-01,2.47879E-01,2.56199E-01,2.64797E-01,2.73685E-01,2.82870E-01,2.92364E-01,3.02176E-01,3.12318E-01,3.22800E-01,3.33634E-01,3.44832E-01,3.56406E-01,3.68367E-01,3.80731E-01,3.93509E-01,4.06716E-01,4.20367E-01,4.34475E-01,4.49057E-01,4.64129E-01,4.79706E-01,4.95806E-01,5.12447E-01,5.29646E-01,5.47422E-01,5.65795E-01,5.84785E-01,6.04412E-01,6.24697E-01,6.45664E-01,6.67334E-01,6.89731E-01,7.12880E-01,7.36806E-01,7.61535E-01,7.87094E-01,8.13511E-01,8.40815E-01,8.69035E-01,8.98202E-01,9.28348E-01,9.59505E-01,9.91709E-01,1.02499E+00,1.05939E+00,1.09495E+00,1.13170E+00,1.16968E+00,1.20894E+00,1.24952E+00,1.29145E+00,1.33480E+00,1.37960E+00,1.42590E+00,1.47376E+00,1.52322E+00,1.57434E+00,1.62718E+00,1.68179E+00,1.73824E+00,1.79658E+00,1.85688E+00,1.91920E+00,1.98361E+00,2.05019E+00,2.11899E+00,2.19011E+00,2.26362E+00,2.33959E+00,2.41811E+00,2.49927E+00,2.58315E+00,2.66985E+00,2.75946E+00,2.85207E+00,2.94780E+00,3.04673E+00,3.14899E+00,3.25468E+00,3.36391E+00,3.47681E+00,3.59350E+00,3.71411E+00,3.83877E+00,3.96761E+00,4.10077E+00,4.23840E+00,4.38065E+00,4.52768E+00,4.67964E+00,4.83670E+00,4.99903E+00,5.16681E+00,5.34022E+00,5.51945E+00,5.70470E+00,5.89617E+00,6.09406E+00,6.29859E+00,6.50998E+00,6.72848E+00,6.95430E+00,7.18770E+00,7.42894E+00,7.67828E+00,7.93598E+00,8.20233E+00,8.47762E+00,8.76215E+00,9.05623E+00,9.36018E+00,9.67434E+00,9.99903E+00,1.03346E+01,1.06815E+01,1.10400E+01,1.14105E+01,1.17935E+01,1.21893E+01,1.25984E+01,1.30212E+01,1.34583E+01,1.39099E+01,1.43768E+01,1.48593E+01,1.53580E+01,1.58735E+01,1.64063E+01,1.69569E+01,1.75260E+01,1.81142E+01,1.87222E+01,1.93505E+01,2.00000E+01],300,2);
active_flux_Res = reshape([ 2.28167E-02,3.78334E-04,2.84121E-02,4.93209E-04,2.91218E-02,4.57074E-04,4.68924E-02,7.09764E-04,3.34661E-02,4.76121E-04,4.25508E-02,5.87545E-04,5.76926E-02,7.76387E-04,4.85918E-02,5.87784E-04,6.06013E-02,7.44067E-04,7.53700E-02,9.66242E-04,5.28366E-02,6.58752E-04,7.45572E-02,8.18903E-04,8.30750E-02,9.66276E-04,8.64436E-02,9.28103E-04,8.93391E-02,9.88825E-04,8.75684E-02,8.79512E-04,9.66103E-02,9.29861E-04,1.16179E-01,1.17903E-03,9.81790E-02,8.77055E-04,1.18189E-01,1.06133E-03,1.99058E-01,1.87299E-03,1.17880E-01,9.70789E-04,1.52113E-01,1.17697E-03,1.84625E-01,1.47960E-03,1.62518E-01,1.14798E-03,1.56543E-01,1.03578E-03,2.09157E-01,1.31754E-03,2.41190E-01,1.52417E-03,3.69370E-01,2.48934E-03,2.08340E-01,1.18501E-03,2.33131E-01,1.27051E-03,3.32382E-01,1.80161E-03,2.80799E-01,1.50129E-03,3.25996E-01,1.66293E-03,3.66004E-01,1.80845E-03,3.93934E-01,1.76025E-03,4.30866E-01,1.81307E-03,5.48061E-01,2.38810E-03,5.67986E-01,2.29236E-03,5.28222E-01,2.05068E-03,6.26851E-01,2.32918E-03,4.98575E-01,1.78316E-03,5.98602E-01,2.14320E-03,6.61995E-01,2.31715E-03,7.12937E-01,2.47532E-03,8.15567E-01,2.82139E-03,7.87405E-01,2.62521E-03,8.61887E-01,2.67903E-03,8.98007E-01,2.77195E-03,9.60038E-01,2.84427E-03,1.07353E+00,3.06046E-03,1.19187E+00,3.28510E-03,1.25283E+00,3.34223E-03,1.31108E+00,3.32273E-03,1.59631E+00,3.99410E-03,1.61280E+00,4.26414E-03,1.74637E+00,4.03529E-03,1.85620E+00,4.05645E-03,1.76758E+00,3.69120E-03,1.99655E+00,4.04056E-03,2.20824E+00,4.25035E-03,2.36041E+00,4.49629E-03,2.62768E+00,4.84879E-03,2.98295E+00,5.50862E-03,2.63524E+00,4.55142E-03,3.09983E+00,5.24600E-03,3.06564E+00,5.08046E-03,3.49435E+00,5.43592E-03,3.59887E+00,5.47649E-03,4.20640E+00,6.08355E-03,4.27076E+00,5.90848E-03,4.79108E+00,6.52152E-03,4.91742E+00,6.49393E-03,5.50996E+00,7.03003E-03,5.78512E+00,6.84767E-03,6.63254E+00,7.96448E-03,7.03535E+00,8.26150E-03,6.48111E+00,7.25578E-03,7.23618E+00,7.73372E-03,7.94946E+00,7.97128E-03,8.74570E+00,8.55524E-03,1.02198E+01,9.93679E-03,9.97767E+00,9.40465E-03,1.09904E+01,1.00936E-02,1.18311E+01,1.05077E-02,1.27120E+01,1.05762E-02,1.38287E+01,1.14013E-02,1.33340E+01,1.10268E-02,1.46988E+01,1.16279E-02,1.63143E+01,1.22137E-02,1.95728E+01,1.38804E-02,1.90077E+01,1.31603E-02,2.02358E+01,1.34661E-02,2.16295E+01,1.36590E-02,2.31870E+01,1.39469E-02,2.47268E+01,1.46907E-02,2.63417E+01,1.49276E-02,2.81237E+01,1.54523E-02,2.99308E+01,1.59413E-02,3.18268E+01,1.63288E-02,3.37999E+01,1.61785E-02,3.59329E+01,1.68686E-02,3.81803E+01,1.72824E-02,4.04620E+01,1.78138E-02,4.28293E+01,1.83432E-02,4.53872E+01,1.87103E-02,4.79530E+01,1.96921E-02,5.05467E+01,2.04814E-02,5.31466E+01,2.11622E-02,5.57700E+01,2.19418E-02,5.84343E+01,2.29572E-02,6.10683E+01,2.24206E-02,6.37445E+01,2.34699E-02,6.63117E+01,2.41828E-02,6.87283E+01,2.42278E-02,7.07835E+01,2.50263E-02,7.26580E+01,2.55031E-02,7.45826E+01,2.55167E-02,7.64426E+01,2.54060E-02,7.82743E+01,2.61828E-02,8.02769E+01,2.67888E-02,8.24432E+01,2.67954E-02,8.46484E+01,2.66648E-02,8.68839E+01,2.70015E-02,8.91014E+01,2.73975E-02,9.13716E+01,2.76366E-02,9.36820E+01,2.80383E-02,9.59938E+01,2.92615E-02,9.83772E+01,3.01998E-02,1.00794E+02,3.03729E-02,1.03390E+02,2.99966E-02,1.06051E+02,2.99182E-02,1.08690E+02,2.93137E-02,1.11228E+02,3.03091E-02,1.13771E+02,3.12056E-02,1.16140E+02,3.13297E-02,1.18618E+02,3.20046E-02,1.21085E+02,3.23623E-02,1.23735E+02,3.30182E-02,1.26665E+02,3.29494E-02,1.29505E+02,3.31581E-02,1.32361E+02,3.40486E-02,1.35281E+02,3.37810E-02,1.38220E+02,3.40584E-02,1.41117E+02,3.45145E-02,1.44068E+02,3.53388E-02,1.46951E+02,3.62275E-02,1.49855E+02,3.69947E-02,1.52721E+02,3.71272E-02,1.55545E+02,3.82093E-02,1.58439E+02,3.91922E-02,1.61310E+02,3.87484E-02,1.64087E+02,3.97899E-02,1.66792E+02,3.83048E-02,1.69538E+02,3.95696E-02,1.72204E+02,4.05281E-02,1.74830E+02,4.19539E-02,1.77466E+02,4.17839E-02,1.80006E+02,4.06310E-02,1.82397E+02,4.10834E-02,1.84753E+02,4.23070E-02,1.87065E+02,4.25857E-02,1.89316E+02,4.18754E-02,1.91460E+02,4.26504E-02,1.93582E+02,4.40938E-02,1.95491E+02,4.56421E-02,1.97277E+02,4.51637E-02,1.98733E+02,4.44902E-02,2.00255E+02,4.67162E-02,2.01761E+02,4.67814E-02,2.03220E+02,4.63600E-02,2.04559E+02,4.85921E-02,2.05848E+02,4.84017E-02,2.05523E+02,4.85782E-02,2.06070E+02,4.66250E-02,2.06312E+02,4.76811E-02,2.06467E+02,4.90919E-02,2.06421E+02,5.03059E-02,2.06252E+02,4.65328E-02,2.05677E+02,4.88203E-02,2.04729E+02,4.89308E-02,2.03577E+02,5.05305E-02,2.02181E+02,5.15378E-02,2.00600E+02,5.10113E-02,1.98629E+02,4.76647E-02,1.96261E+02,4.89905E-02,1.93539E+02,4.86308E-02,1.90484E+02,4.94515E-02,1.86920E+02,5.06621E-02,1.82958E+02,4.90184E-02,1.78446E+02,4.85210E-02,1.73607E+02,4.75771E-02,1.68214E+02,4.79128E-02,1.62399E+02,4.70587E-02,1.56128E+02,4.67193E-02,1.48828E+02,4.48196E-02,1.41679E+02,4.48217E-02,1.34020E+02,4.21525E-02,1.25728E+02,4.14235E-02,1.18691E+02,4.16427E-02,1.11956E+02,3.89013E-02,1.05506E+02,3.70918E-02,9.93339E+01,3.60981E-02,9.37538E+01,3.61995E-02,8.84053E+01,3.35381E-02,8.30824E+01,3.41196E-02,7.77305E+01,3.21277E-02,7.23162E+01,3.17786E-02,6.73782E+01,2.87376E-02,6.30613E+01,2.79994E-02,5.92614E+01,2.72543E-02,5.49174E+01,2.61968E-02,5.16224E+01,2.45684E-02,4.87550E+01,2.37068E-02,4.62712E+01,2.23425E-02,4.43215E+01,2.23744E-02,4.26132E+01,2.06879E-02,4.09562E+01,2.01469E-02,3.93866E+01,2.00008E-02,3.80261E+01,1.94299E-02,3.69181E+01,1.94761E-02,3.58359E+01,1.84387E-02,3.49035E+01,1.80631E-02,3.40202E+01,1.80592E-02,3.31678E+01,1.82956E-02,3.24501E+01,1.72381E-02,3.18142E+01,1.68909E-02,3.11783E+01,1.71872E-02,3.05837E+01,1.71506E-02,3.00608E+01,1.64593E-02,2.95695E+01,1.68667E-02,2.90859E+01,1.67778E-02,2.86081E+01,1.67056E-02,2.81932E+01,1.62498E-02,2.77310E+01,1.56592E-02,2.72717E+01,1.57546E-02,2.68282E+01,1.52986E-02,2.63340E+01,1.60349E-02,2.58801E+01,1.56875E-02,2.53275E+01,1.55959E-02,2.47730E+01,1.69346E-02,2.42293E+01,1.58937E-02,2.36331E+01,1.49547E-02,2.29947E+01,1.56519E-02,2.22872E+01,1.56155E-02,2.15430E+01,1.54133E-02,2.08041E+01,1.45217E-02,2.00646E+01,1.47453E-02,1.92697E+01,1.42613E-02,1.84183E+01,1.41436E-02,1.75541E+01,1.41061E-02,1.66627E+01,1.42033E-02,1.58468E+01,1.34059E-02,1.50101E+01,1.35608E-02,1.41865E+01,1.28175E-02,1.33413E+01,1.25715E-02,1.25062E+01,1.19984E-02,1.16921E+01,1.17927E-02,1.08993E+01,1.14752E-02,1.00417E+01,1.11163E-02,9.28408E+00,1.04919E-02,8.52165E+00,1.02309E-02,7.76820E+00,9.37703E-03,7.02371E+00,9.07100E-03,6.32084E+00,8.71677E-03,5.63028E+00,8.34019E-03,5.00049E+00,7.70426E-03,4.42161E+00,7.46777E-03,3.86682E+00,6.74825E-03,3.35274E+00,6.41632E-03,2.89436E+00,5.68331E-03,2.49024E+00,5.53125E-03,2.12039E+00,4.95840E-03,1.78039E+00,4.63900E-03,1.49741E+00,4.22802E-03,1.25034E+00,3.96204E-03,1.03348E+00,3.43319E-03,8.56160E-01,3.34817E-03,6.94738E-01,2.83689E-03,5.75978E-01,2.67483E-03,4.68595E-01,2.34889E-03,3.64656E-01,2.08537E-03,2.88346E-01,1.88464E-03,2.25707E-01,1.65525E-03,1.71188E-01,1.45631E-03,1.32777E-01,1.26811E-03,1.01343E-01,1.10075E-03,7.37858E-02,9.99509E-04,5.64526E-02,8.61730E-04,3.89573E-02,6.96689E-04,2.92152E-02,6.27577E-04,2.07165E-02,5.37980E-04,1.41502E-02,4.42992E-04,8.91663E-03,3.28658E-04,6.56060E-03,2.87648E-04,4.02254E-03,2.34856E-04,3.05177E-03,2.08316E-04,1.62508E-03,1.41359E-04,1.24877E-03,1.35707E-04,1.41367E-03,1.55208E-04],2,1,300);

