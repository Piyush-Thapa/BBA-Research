tabstat ROA RollingSD_ROA CDR_c LADR_c BSIZE AQ BC , statistics(mean median sd min max) columns(statistics)

    variable |      mean       p50        sd       min       max
-------------+--------------------------------------------------
         ROA |  .0143413  .0141753  .0057977  .0000113  .0357022
RollingSD_~A |  .0028663  .0025004  .0019387  .0002048  .0129079
       CDR_c |  3.81e-16  .0139238  .1087525 -.7423008  .2268323
      LADR_c |  3.58e-17 -.0074954  .0582294 -.1047214  .3214696
       BSIZE |  25.73729  25.75155  .6139728  24.34425  27.04587
          AQ |  .0192475    .01395  .0162214     .0001     .0883
          BC |  .1082333  .1041273   .025622  .0434292  .1953802
----------------------------------------------------------------

pwcorr ROA RollingSD_ROA CDR_c LADR_c BSIZE AQ BC , sig

             |      ROA Rollin~A    CDR_c   LADR_c    BSIZE       AQ       BC
-------------+---------------------------------------------------------------
         ROA |   1.0000 
             |
             |
RollingSD_~A |  -0.0726   1.0000 
             |   0.3615
             |
       CDR_c |  -0.1907  -0.1972   1.0000 
             |   0.0068   0.0124
             |
      LADR_c |   0.2666   0.1160  -0.1535   1.0000 
             |   0.0001   0.1440   0.0300
             |
       BSIZE |  -0.4872   0.1057   0.1744  -0.1913   1.0000 
             |   0.0000   0.1833   0.0135   0.0066
             |
          AQ |  -0.2083   0.3771  -0.1880  -0.1334   0.3467   1.0000 
             |   0.0031   0.0000   0.0077   0.0598   0.0000
             |
          BC |   0.3379   0.0602   0.2538   0.2165  -0.0286  -0.0028   1.0000 
             |   0.0000   0.4495   0.0003   0.0021   0.6874   0.9689

reg ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER

      Source |       SS           df       MS      Number of obs   =       200
-------------+----------------------------------   F(12, 187)      =     16.43
       Model |  .003433274        12  .000286106   Prob > F        =    0.0000
    Residual |  .003255762       187   .00001741   R-squared       =    0.5133
-------------+----------------------------------   Adj R-squared   =    0.4820
       Total |  .006689036       199  .000033613   Root MSE        =    .00417

------------------------------------------------------------------------------------
               ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0131632   .0035107    -3.75   0.000    -.0200888   -.0062375
                   |
         covid_cat |
     During COVID  |  -.0043759   .0013538    -3.23   0.001    -.0070466   -.0017051
       Post-COVID  |  -.0062272   .0011513    -5.41   0.000    -.0084983   -.0039561
                   |
 covid_cat#c.CDR_c |
     During COVID  |   .0122578   .0135401     0.91   0.366    -.0144531    .0389687
       Post-COVID  |   .0212238    .011375     1.87   0.064    -.0012161    .0436637
                   |
            LADR_c |  -.0015861   .0064226    -0.25   0.805    -.0142561    .0110839
                   |
covid_cat#c.LADR_c |
     During COVID  |  -.0001486   .0159074    -0.01   0.993    -.0315296    .0312325
       Post-COVID  |   .0381467   .0158806     2.40   0.017     .0068186    .0694747
                   |
             BSIZE |  -.0002949   .0007917    -0.37   0.710    -.0018568     .001267
                AQ |  -.0099278   .0224151    -0.44   0.658    -.0541467     .034291
                BC |    .077875   .0127099     6.13   0.000     .0528019    .1029482
            MERGER |   -.000571    .000695    -0.82   0.412    -.0019421    .0008001
             _cons |   .0160582    .019969     0.80   0.422    -.0233353    .0554517
------------------------------------------------------------------------------------

. vif

    Variable |       VIF       1/VIF  
-------------+----------------------
       CDR_c |      1.67    0.600198
   covid_cat |
          1  |      3.37    0.296844
          2  |      2.44    0.410502
   covid_cat#|
     c.CDR_c |
          1  |      3.18    0.314944
          2  |      1.14    0.877194
      LADR_c |      1.60    0.625537
   covid_cat#|
    c.LADR_c |
          1  |      1.54    0.648199
          2  |      1.39    0.718137
       BSIZE |      2.70    0.370253
          AQ |      1.51    0.661765
          BC |      1.21    0.824994
      MERGER |      1.36    0.733255
-------------+----------------------
    Mean VIF |      1.93

. 
reg RollingSD_ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER

      Source |       SS           df       MS      Number of obs   =       160
-------------+----------------------------------   F(12, 147)      =      6.42
       Model |  .000205439        12   .00001712   Prob > F        =    0.0000
    Residual |  .000392177       147  2.6679e-06   R-squared       =    0.3438
-------------+----------------------------------   Adj R-squared   =    0.2902
       Total |  .000597616       159  3.7586e-06   Root MSE        =    .00163

------------------------------------------------------------------------------------
     RollingSD_ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0020587   .0015632    -1.32   0.190    -.0051478    .0010305
                   |
         covid_cat |
     During COVID  |   .0000459   .0005444     0.08   0.933    -.0010298    .0011217
       Post-COVID  |  -.0016883   .0004848    -3.48   0.001    -.0026464   -.0007303
                   |
 covid_cat#c.CDR_c |
     During COVID  |   .0033494   .0053709     0.62   0.534    -.0072648    .0139636
       Post-COVID  |   .0056881   .0045211     1.26   0.210    -.0032466    .0146228
                   |
            LADR_c |   .0027135   .0030193     0.90   0.370    -.0032534    .0086803
                   |
covid_cat#c.LADR_c |
     During COVID  |   .0123105   .0064051     1.92   0.057    -.0003475    .0249685
       Post-COVID  |   .0085289   .0063959     1.33   0.184    -.0041108    .0211686
                   |
             BSIZE |   .0003155   .0004425     0.71   0.477     -.000559    .0011899
                AQ |   .0895823   .0127791     7.01   0.000     .0643279    .1148368
                BC |  -.0090869   .0063624    -1.43   0.155    -.0216605    .0034866
            MERGER |  -.0010312   .0002959    -3.48   0.001    -.0016161   -.0004464
             _cons |  -.0049603   .0114712    -0.43   0.666      -.02763    .0177094
------------------------------------------------------------------------------------

. vif

    Variable |       VIF       1/VIF  
-------------+----------------------
       CDR_c |      1.49    0.668986
   covid_cat |
          1  |      3.33    0.300100
          2  |      2.64    0.378371
   covid_cat#|
     c.CDR_c |
          1  |      3.13    0.319134
          2  |      1.17    0.852472
      LADR_c |      1.91    0.522440
   covid_cat#|
    c.LADR_c |
          1  |      1.62    0.616331
          2  |      1.46    0.682689
       BSIZE |      3.04    0.329271
          AQ |      2.23    0.448150
          BC |      1.44    0.695775
      MERGER |      1.31    0.763489
-------------+----------------------
    Mean VIF |      2.07

. 
xtset ID Y
       panel variable:  ID (strongly balanced)
        time variable:  Y, 2014 to 2023
                delta:  1 unit

. asdoc xtreg ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER, fe save(fe)

Fixed-effects (within) regression               Number of obs     =        200
Group variable: ID                              Number of groups  =         20

R-sq:                                           Obs per group:
     within  = 0.5299                                         min =         10
     between = 0.2237                                         avg =       10.0
     overall = 0.4564                                         max =         10

                                                F(12,168)         =      15.78
corr(u_i, Xb)  = -0.0893                        Prob > F          =     0.0000

------------------------------------------------------------------------------------
               ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0042984   .0042148    -1.02   0.309    -.0126193    .0040224
                   |
         covid_cat |
     During COVID  |  -.0031154   .0013706    -2.27   0.024    -.0058212   -.0004095
       Post-COVID  |  -.0034856   .0015338    -2.27   0.024    -.0065136   -.0004577
                   |
 covid_cat#c.CDR_c |
     During COVID  |   .0116542   .0134963     0.86   0.389    -.0149901    .0382985
       Post-COVID  |   .0196689   .0112854     1.74   0.083    -.0026105    .0419482
                   |
            LADR_c |   .0065303   .0072297     0.90   0.368    -.0077424    .0208029
                   |
covid_cat#c.LADR_c |
     During COVID  |  -.0034574   .0153852    -0.22   0.822    -.0338306    .0269157
       Post-COVID  |   .0282321   .0153674     1.84   0.068     -.002106    .0585702
                   |
             BSIZE |  -.0029403   .0011593    -2.54   0.012    -.0052289   -.0006517
                AQ |  -.0126647   .0347104    -0.36   0.716    -.0811894      .05586
                BC |   .0528702   .0181627     2.91   0.004     .0170137    .0887267
            MERGER |  -.0006768   .0011756    -0.58   0.566    -.0029977    .0016441
             _cons |    .086107   .0292156     2.95   0.004       .02843     .143784
-------------------+----------------------------------------------------------------
           sigma_u |  .00250622
           sigma_e |  .00382065
               rho |  .30084341   (fraction of variance due to u_i)
------------------------------------------------------------------------------------
F test that all u_i=0: F(19, 168) = 2.90                     Prob > F = 0.0001

xttest0

Breusch and Pagan Lagrangian multiplier test for random effects

        ROA[ID,t] = Xb + u[ID] + e[ID,t]

        Estimated results:
                         |       Var     sd = sqrt(Var)
                ---------+-----------------------------
                     ROA |   .0000336       .0057977
                       e |   .0000146       .0038206
                       u |   1.63e-06       .0012786

        Test:   Var(u) = 0
                             chibar2(01) =     9.72
                          Prob > chibar2 =   0.0009

hausman fe re

                 ---- Coefficients ----
             |      (b)          (B)            (b-B)     sqrt(diag(V_b-V_B))
             |       fe           re         Difference          S.E.
-------------+----------------------------------------------------------------
       CDR_c |   -.0042984     -.009917        .0056185        .0020759
   covid_cat |
          1  |   -.0031154    -.0038719        .0007565        .0003354
          2  |   -.0034856    -.0054663        .0019806        .0009332
   covid_cat#|
     c.CDR_c |
          1  |    .0116542     .0111262        .0005279        .0030237
          2  |    .0196689     .0197203       -.0000514        .0023097
      LADR_c |    .0065303     .0016628        .0048674        .0030772
   covid_cat#|
    c.LADR_c |
          1  |   -.0034574     -.001929       -.0015284        .0017931
          2  |    .0282321     .0346898       -.0064577        .0013878
       BSIZE |   -.0029403     -.001123       -.0018173        .0007515
          AQ |   -.0126647    -.0016701       -.0109946        .0237102
          BC |    .0528702      .068254       -.0153839        .0114044
      MERGER |   -.0006768    -.0008492        .0001724        .0008481
------------------------------------------------------------------------------
                           b = consistent under Ho and Ha; obtained from xtreg
            B = inconsistent under Ha, efficient under Ho; obtained from xtreg

    Test:  Ho:  difference in coefficients not systematic

                 chi2(12) = (b-B)'[(V_b-V_B)^(-1)](b-B)
                          =       21.41
                Prob>chi2 =      0.0447
				
predict resid, e

. swilk resid

                   Shapiro-Wilk W test for normal data

    Variable |        Obs       W           V         z       Prob>z
-------------+------------------------------------------------------
       resid |        200    0.95393      6.872     4.435    0.00000

. 
. qnorm resid

 label values covid_cat

. gen covid_d1 = covid_cat == 1

. 
. gen covid_d2 = covid_cat == 2

. gen CDR_c_d1 = CDR_c * covid_d1

. 
. gen CDR_c_d2 = CDR_c * covid_d2

. 
. 
. 
. gen LADR_c_d1 = LADR_c * covid_d1

. 
. gen LADR_c_d2 = LADR_c * covid_d2

. xtserial ROA CDR_c LADR_c covid_d1 covid_d2 CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2 BSIZE AQ BC MERGER

Wooldridge test for autocorrelation in panel data
H0: no first order autocorrelation
    F(  1,      19) =     85.082
           Prob > F =      0.0000

xtscc ROA CDR_c LADR_c covid_d1 covid_d2 CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2 BSIZE AQ BC MERGER,fe

Regression with Driscoll-Kraay standard errors   Number of obs     =       200
Method: Fixed-effects regression                 Number of groups  =        20
Group variable (i): ID                           F( 12,     9)     =    434.48
maximum lag: 2                                   Prob > F          =    0.0000
                                                 within R-squared  =    0.5299

------------------------------------------------------------------------------
             |             Drisc/Kraay
         ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
       CDR_c |  -.0042984   .0032367    -1.33   0.217    -.0116204    .0030235
      LADR_c |   .0065303   .0042863     1.52   0.162    -.0031659    .0162264
    covid_d1 |  -.0031154    .001407    -2.21   0.054    -.0062983    .0000675
    covid_d2 |  -.0034856   .0023944    -1.46   0.179     -.008902    .0019308
    CDR_c_d1 |   .0116542   .0076357     1.53   0.161     -.005619    .0289274
    CDR_c_d2 |   .0196689   .0078922     2.49   0.034     .0018155    .0375222
   LADR_c_d1 |  -.0034574   .0091331    -0.38   0.714     -.024118    .0172031
   LADR_c_d2 |   .0282321   .0091897     3.07   0.013     .0074435    .0490207
       BSIZE |  -.0029403   .0019621    -1.50   0.168    -.0073789    .0014983
          AQ |  -.0126647   .0469678    -0.27   0.794    -.1189133    .0935839
          BC |   .0528702   .0173021     3.06   0.014       .01373    .0920104
      MERGER |  -.0006768   .0010827    -0.63   0.547    -.0031262    .0017725
       _cons |    .086107   .0502437     1.71   0.121    -.0275521    .1997661
------------------------------------------------------------------------------

asdoc xtreg RollingSD_ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER, fe save(fe)
(File fe.doc already exists, option append was assumed)

Fixed-effects (within) regression               Number of obs     =        160
Group variable: ID                              Number of groups  =         20

R-sq:                                           Obs per group:
     within  = 0.2886                                         min =          8
     between = 0.2142                                         avg =        8.0
     overall = 0.2496                                         max =          8

                                                F(12,128)         =       4.33
corr(u_i, Xb)  = -0.2646                        Prob > F          =     0.0000

------------------------------------------------------------------------------------
     RollingSD_ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0004308    .001823    -0.24   0.814    -.0040379    .0031763
                   |
         covid_cat |
     During COVID  |   .0001431   .0006282     0.23   0.820    -.0010999    .0013861
       Post-COVID  |  -.0019529   .0007083    -2.76   0.007    -.0033543   -.0005514
                   |
 covid_cat#c.CDR_c |
     During COVID  |  -.0000224   .0057227    -0.00   0.997    -.0113458     .011301
       Post-COVID  |      .0041   .0048097     0.85   0.396    -.0054168    .0136169
                   |
            LADR_c |   .0015055    .003728     0.40   0.687    -.0058711    .0088821
                   |
covid_cat#c.LADR_c |
     During COVID  |   .0125814   .0066228     1.90   0.060     -.000523    .0256858
       Post-COVID  |   .0058732   .0065594     0.90   0.372    -.0071057    .0188522
                   |
             BSIZE |  -.0001985   .0006947    -0.29   0.776     -.001573     .001176
                AQ |   .0997009   .0206159     4.84   0.000     .0589087     .140493
                BC |  -.0344461   .0107182    -3.21   0.002    -.0556539   -.0132383
            MERGER |  -.0007693   .0007099    -1.08   0.281     -.002174    .0006353
             _cons |   .0109483   .0178872     0.61   0.542    -.0244445    .0463411
-------------------+----------------------------------------------------------------
           sigma_u |  .00096937
           sigma_e |  .00157024
               rho |   .2759446   (fraction of variance due to u_i)
------------------------------------------------------------------------------------
F test that all u_i=0: F(19, 128) = 1.63                     Prob > F = 0.0572


 asdoc xtreg RollingSD_ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER, re save(rem2)

Random-effects GLS regression                   Number of obs     =        160
Group variable: ID                              Number of groups  =         20

R-sq:                                           Obs per group:
     within  = 0.2664                                         min =          8
     between = 0.5634                                         avg =        8.0
     overall = 0.3408                                         max =          8

                                                Wald chi2(12)     =      66.81
corr(u_i, X)   = 0 (assumed)                    Prob > chi2       =     0.0000

------------------------------------------------------------------------------------
     RollingSD_ROA |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0017279   .0015994    -1.08   0.280    -.0048626    .0014068
                   |
         covid_cat |
     During COVID  |   .0001094   .0005521     0.20   0.843    -.0009728    .0011915
       Post-COVID  |  -.0017287   .0005187    -3.33   0.001    -.0027453   -.0007121
                   |
 covid_cat#c.CDR_c |
     During COVID  |   .0027144   .0053227     0.51   0.610     -.007718    .0131468
       Post-COVID  |    .005606   .0044903     1.25   0.212    -.0031948    .0144069
                   |
            LADR_c |   .0028356   .0031036     0.91   0.361    -.0032473    .0089185
                   |
covid_cat#c.LADR_c |
     During COVID  |   .0128457   .0062836     2.04   0.041     .0005301    .0251612
       Post-COVID  |   .0081453   .0062841     1.30   0.195    -.0041714     .020462
                   |
             BSIZE |   .0001868   .0004987     0.37   0.708    -.0007907    .0011644
                AQ |   .0940162   .0142382     6.60   0.000     .0661097    .1219226
                BC |  -.0140662   .0071571    -1.97   0.049    -.0280938   -.0000386
            MERGER |  -.0010622   .0003566    -2.98   0.003    -.0017611   -.0003633
             _cons |  -.0011337   .0129118    -0.09   0.930    -.0264402    .0241729
-------------------+----------------------------------------------------------------
           sigma_u |  .00049932
           sigma_e |  .00157024
               rho |  .09183117   (fraction of variance due to u_i)
------------------------------------------------------------------------------------

xttest0

Breusch and Pagan Lagrangian multiplier test for random effects

        RollingSD_ROA[ID,t] = Xb + u[ID] + e[ID,t]

        Estimated results:
                         |       Var     sd = sqrt(Var)
                ---------+-----------------------------
               Rolling~A |   3.76e-06       .0019387
                       e |   2.47e-06       .0015702
                       u |   2.49e-07       .0004993

        Test:   Var(u) = 0
                             chibar2(01) =     0.68
    
                      Prob > chibar2 =   0.2049
					  
estat hettest

Breusch-Pagan / Cook-Weisberg test for heteroskedasticity 
         Ho: Constant variance
         Variables: fitted values of RollingSD_ROA

         chi2(1)      =    38.86
         Prob > chi2  =   0.0000

estat hettest

Breusch-Pagan / Cook-Weisberg test for heteroskedasticity 
         Ho: Constant variance
         Variables: fitted values of RollingSD_ROA

         chi2(1)      =    38.86
         Prob > chi2  =   0.0000


		 
	reg RollingSD_ROA c.CDR_c##i.covid_cat c.LADR_c##i.covid_cat BSIZE AQ BC MERGER, vce(cluster ID)

Linear regression                               Number of obs     =        160
                                                F(12, 19)         =       6.21
                                                Prob > F          =     0.0002
                                                R-squared         =     0.3438
                                                Root MSE          =     .00163

                                          (Std. Err. adjusted for 20 clusters in ID)
------------------------------------------------------------------------------------
                   |               Robust
     RollingSD_ROA |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------------+----------------------------------------------------------------
             CDR_c |  -.0020587   .0010112    -2.04   0.056    -.0041752    .0000579
                   |
         covid_cat |
     During COVID  |   .0000459   .0006058     0.08   0.940    -.0012219    .0013138
       Post-COVID  |  -.0016883   .0005751    -2.94   0.008     -.002892   -.0004847
                   |
 covid_cat#c.CDR_c |
     During COVID  |   .0033494   .0051736     0.65   0.525    -.0074791     .014178
       Post-COVID  |   .0056881   .0044788     1.27   0.219    -.0036861    .0150623
                   |
            LADR_c |   .0027135   .0034443     0.79   0.441    -.0044954    .0099224
                   |
covid_cat#c.LADR_c |
     During COVID  |   .0123105   .0054125     2.27   0.035     .0009821    .0236389
       Post-COVID  |   .0085289   .0046493     1.83   0.082    -.0012022      .01826
                   |
             BSIZE |   .0003155   .0004393     0.72   0.481    -.0006039    .0012348
                AQ |   .0895823    .019783     4.53   0.000     .0481761    .1309886
                BC |  -.0090869   .0073006    -1.24   0.228    -.0243673    .0061934
            MERGER |  -.0010312    .000346    -2.98   0.008    -.0017554   -.0003071
             _cons |  -.0049603   .0115622    -0.43   0.673    -.0291603    .0192397
------------------------------------------------------------------------------------

asdoc ivregress 2sls ROA (CDR_c LADR_c CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2 = CDR_L1 LADR_L1 CDR_L1_d1 CDR_L1_d2 LADR_L1_d1 LADR_L1_d2) BSIZE AQ BC MERGER i
> .covid_cat, save(Ivreg)

Instrumental variables (2SLS) regression          Number of obs   =        180
                                                  Wald chi2(12)   =     222.40
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.5225
                                                  Root MSE        =     .00385

-------------------------------------------------------------------------------
          ROA |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
        CDR_c |   -.026991   .0070189    -3.85   0.000    -.0407478   -.0132341
       LADR_c |  -.0055058   .0125074    -0.44   0.660    -.0300199    .0190082
     CDR_c_d1 |   .0222305   .0189198     1.17   0.240    -.0148515    .0593126
     CDR_c_d2 |   .0457914   .0144774     3.16   0.002     .0174162    .0741665
    LADR_c_d1 |  -.0020225   .0192603    -0.11   0.916    -.0397721    .0357271
    LADR_c_d2 |   .0583028   .0228751     2.55   0.011     .0134685    .1031371
        BSIZE |  -.0003234   .0008952    -0.36   0.718    -.0020779    .0014312
           AQ |  -.0749917   .0269834    -2.78   0.005    -.1278782   -.0221052
           BC |   .0896648   .0154391     5.81   0.000     .0594047    .1199248
       MERGER |   .0006033   .0007271     0.83   0.407    -.0008217    .0020283
              |
    covid_cat |
During COVID  |   -.004274   .0016376    -2.61   0.009    -.0074836   -.0010643
  Post-COVID  |  -.0046101   .0011295    -4.08   0.000    -.0068238   -.0023963
              |
        _cons |   .0158391   .0230439     0.69   0.492    -.0293261    .0610043
-------------------------------------------------------------------------------
Instrumented:  CDR_c LADR_c CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2
Instruments:   BSIZE AQ BC MERGER 1.covid_cat 2.covid_cat CDR_L1 LADR_L1
               CDR_L1_d1 CDR_L1_d2 LADR_L1_d1 LADR_L1_d2
			   
estat endogenous
  Tests of endogeneity
  Ho: variables are exogenous

  Wu-Hausman F(6,161)             =  2.15381  (p = 0.0502)

  asdoc ivregress 2sls RollingSD_ROA (CDR_c LADR_c CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2 = CDR_L1 LADR_L1 CDR_L1_d1 CDR_L1_d2 LADR_L1_d1 LADR_L1_d2) BSIZE AQ B
> C MERGER i.covid_cat
(File xtivreg.doc already exists, option append was assumed)

Instrumental variables (2SLS) regression          Number of obs   =        160
                                                  Wald chi2(12)   =      82.01
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.3288
                                                  Root MSE        =     .00158

-------------------------------------------------------------------------------
RollingSD_ROA |      Coef.   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
        CDR_c |   -.001978   .0036285    -0.55   0.586    -.0090898    .0051337
       LADR_c |   .0062462   .0054332     1.15   0.250    -.0044026    .0168951
     CDR_c_d1 |   .0001305   .0079967     0.02   0.987    -.0155427    .0158038
     CDR_c_d2 |   .0093612    .006271     1.49   0.135    -.0029298    .0216522
    LADR_c_d1 |   .0125709   .0079181     1.59   0.112    -.0029483    .0280902
    LADR_c_d2 |   .0063937   .0093404     0.68   0.494    -.0119132    .0247005
        BSIZE |   .0003932   .0004359     0.90   0.367    -.0004611    .0012475
           AQ |    .091111    .013875     6.57   0.000     .0639165    .1183055
           BC |  -.0106732   .0069271    -1.54   0.123      -.02425    .0029036
       MERGER |  -.0010264   .0003134    -3.27   0.001    -.0016406   -.0004121
              |
    covid_cat |
During COVID  |   .0003725   .0006755     0.55   0.581    -.0009515    .0016965
  Post-COVID  |  -.0016673   .0004759    -3.50   0.000    -.0026001   -.0007345
              |
        _cons |  -.0068594   .0113062    -0.61   0.544    -.0290192    .0153004
-------------------------------------------------------------------------------
Instrumented:  CDR_c LADR_c CDR_c_d1 CDR_c_d2 LADR_c_d1 LADR_c_d2
Instruments:   BSIZE AQ BC MERGER 1.covid_cat 2.covid_cat CDR_L1 LADR_L1
               CDR_L1_d1 CDR_L1_d2 LADR_L1_d1 LADR_L1_d2

			   estat endogenous

  Tests of endogeneity
  Ho: variables are exogenous

  Durbin (score) chi2(6)          =  3.47391  (p = 0.7474)
  Wu-Hausman F(6,141)             =  .521555  (p = 0.7912)
