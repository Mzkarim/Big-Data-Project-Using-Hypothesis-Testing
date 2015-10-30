proc import out= work.kristine 
            datafile= "\\acfs-02\VappsUsers$\kristine.hoo\Documents\proj3.xls" 
dbms=excel replace;
range="sheet1$"; 
getnames=yes;
mixed=no;
scantext=yes;
usedate=yes;
scantime=yes;
run;
/* Formatting Missing Values and Sort */
proc format;
value byses 99.998 = 'Missing' ;
proc format;
value F1S34E 8 = 'Missing' ;
proc format;
value BYS68A 8 = 'Missing' ;
proc sort data=work.kristine;
by F1S34E;
run;
/* variables used BYSES Socio-economic status composite  F1S34E Advanced placement program BYS68A Classes for gifted or talented students */
proc means data=work.kristine;
  var byses;
run;
proc freq data=work.kristine;
  tables  F1S34E F1S34E*BYS68A;
run;
proc logistic data= work.kristine descending;
  model F1S34E = BYSES  BYS68A  ;
run;
