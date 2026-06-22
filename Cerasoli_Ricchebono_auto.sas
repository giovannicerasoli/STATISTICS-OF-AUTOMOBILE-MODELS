data auto;
infile ".......\auto.txt";
  input Model $18. Origin $ price mpg rep78 rep77 hroom
		rseat trunk weight length turn displa gratio;
run;

proc contents data=auto;
run;

/*Conversione variabili in unità di misura europee e creazione variaible difference*/
data auto;
set auto;
  label price="price ($)";
  mpg=round(mpg*0.43,1); label mpg="mpg (km/l)";
  hroom=round(hroom*2.54,1); label hroom="hroom (cm)";
  rseat=round(rseat*2.54,1); label rseat="rseat (cm)";
  trunk=round(trunk*28.3168,1); label trunk="trunk (l)";
  weight=round(weight*0.453592,1); label weight="weight (kg)";
  length=round(length*2.54,1); label length="length (cm)";
  turn=round(turn*0.3048,.1); label turn="turn (m)";
  displa=round(displa*0.0163871,.01); label displa="displa (l)";
  if rep77<rep78 then difference='+';
  if rep77>rep78 then difference='-';
  if rep77=rep78 then difference='=';
  if rep77=. then difference='n';
  if rep78=. then difference='n';
run;

/*Creazione due dataset rep78 e rep77 e sort*/
data rep78;
set auto;
  drop rep77;
run;
proc sort data=rep78; by rep78; run;
data rep77;
set auto;
  drop rep78;
run;
proc sort data=rep77; by rep77; run;

/*Procedura means per vedere media, dev.standard*/
proc means data=auto;
  var rep78 rep77;
run;

/*Procedura freq per vedere frequenze assolute e percentuali, compresi i missing*/
proc freq data=auto;
  tables rep77 rep78 difference / missing nocum;
run;

/*Frequenze assolute e percentuali origin * rep*/
proc freq data=auto;
  tables Origin*rep77 Origin*rep78 Origin*difference / missing nocum nocol norow;
run;

/*Grafici a barre frequenze ass origin * rep e origin * difference*/
proc gchart data=auto;
  vbar rep77 / group=origin discrete patternid=group axis=0 10 20 30 40;
  title "Grafico a barre origin x rep77";
run;
proc gchart data=auto;
  vbar rep78 / group=origin discrete patternid=group axis=0 10 20 30 40;
  title "Grafico a barre origin x rep78";
run;
proc gchart data=auto;
  vbar difference / group=origin discrete patternid=group axis=0 10 20 30 40;
  title "Grafico a barre origin x difference";
run;

/*Profili riga origine per rep*/
proc freq data=auto;
  tables Origin*rep77 Origin*rep78 / missing nocum nofreq nopercent nocol;
run;

/*Profili colonna origine per rep*/
proc freq data=auto;
  tables Origin*rep77 Origin*rep78 / missing nocum nofreq nopercent norow;
run;

/*Boxplot vari usando le macro*/
%let var = price mpg hroom rseat trunk weight length turn displa gratio;
%macro boxplot_rep78;
%do j=1 %to 10;
%let k=%scan(&var,&j);
proc boxplot data=rep78;
  plot &k*rep78 / boxstyle=schematicid;
  inset min mean max stddev / header = "Statistiche &k" pos = tm;
  title "&k x rep78";
run;
%end;
%mend;
%boxplot_rep78
%macro boxplot_rep77;
%do j=1 %to 10;
%let k=%scan(&var,&j);
proc boxplot data=rep77;
  plot &k*rep77 / boxstyle=schematicid;
  inset min mean max stddev / header = "Statistiche &k" pos = tm;
  title "&k x rep77";
run;
%end;
%mend;
%boxplot_rep77

/*Gplot vari*/
symbol1 c=black v=plus; symbol2 c=red v=dot; symbol3 c=blue v=dot; symbol4 c=lime v=dot; symbol5 c=pink v=dot; symbol6 c=black v=dot; 
proc gplot data=rep77;
  plot weight*length=rep77;
  title "Scatterplot weight x length per rep77";
run;

proc gplot data=rep78;
  plot weight*length=rep78;
  title "Scatterplot weight x length per rep78";
run;

proc gplot data=rep77;
  plot displa*weight=rep77;
  title "Scatterplot displa x weight per rep77";
run;

proc gplot data=rep78;
  plot displa*weight=rep78;
  title "Scatterplot displa x weight per rep78";
run;

proc gplot data=auto;
  plot displa*weight=origin;
  title "Scatterplot displa x weight per origin";
  symbol1 c=red v=dot; symbol2 c=gold v=dot; symbol3 c=green v=dot;
run;

proc gplot data=auto;
  plot weight*length=origin;
  title "Scatterplot weight x length";
  symbol1 c=red v=dot; symbol2 c=gold v=dot; symbol3 c=green v=dot;
run;

proc gplot data=auto;
  plot turn*length=origin;
  title "Scatterplot turn x length";
  symbol1 c=red v=dot; symbol2 c=gold v=dot; symbol3 c=green v=dot;
run;

proc gplot data=auto;
  plot turn*weight=origin;
  title "Scatterplot turn x weight";
  symbol1 c=red v=dot; symbol2 c=gold v=dot; symbol3 c=green v=dot;
run;

proc gchart data=auto;
  pie origin / percent=inside slice=arrow;
    title "Grafico a torta origin";
run;

proc gchart data=auto;
  pie rep77 / percent=inside missing discrete slice=arrow;
    title "Grafico a torta rep77";
run;

proc gchart data=auto;
  pie rep78 / percent=inside missing discrete slice=arrow;
    title "Grafico a torta rep78";
run;

proc gchart data=auto;
  pie rep77 / percent=inside missing discrete group=origin slice=arrow;
    title "Grafico a torta rep77 per origin";
run;

proc gchart data=auto;
  pie rep78 / percent=inside missing discrete group=origin slice=arrow;
    title "Grafico a torta rep78 per origin";
run;
