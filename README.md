# Statistics of Automobile Models

Progetto di analisi statistica descrittiva sui modelli automobilistici venduti negli Stati Uniti nel 1979.

## Autori

* Giovanni Giacomo Cerasoli
* Alessandro Ricchebono

## Dataset

Il dataset contiene informazioni su **74 modelli di automobili** venduti negli Stati Uniti nel 1979.

Le osservazioni comprendono 15 variabili relative a:

* origine dell’automobile;
* prezzo;
* caratteristiche fisiche e meccaniche;
* consumi;
* valutazioni sulle riparazioni.

L’analisi si concentra in particolare su:

```r id="eqns7n"
rep77
rep78
```

due valutazioni della qualità delle riparazioni su una scala da 1 a 5:

```r id="c2kel0"
1 = valutazione peggiore
5 = valutazione migliore
```

## Obiettivo

L’obiettivo del progetto è descrivere le caratteristiche delle automobili in relazione alle valutazioni `rep77` e `rep78`, evidenziando eventuali differenze tra i modelli con valutazioni migliori e peggiori.

Sono state inoltre analizzate le differenze per area di origine:

```r id="o2rvvm"
A = auto americane
E = auto europee
J = auto giapponesi
```

## Analisi delle valutazioni

Il valore più frequente per entrambe le variabili è il livello `3`.

```r id="nvg6g4"
rep77 -> circa 36%
rep78 -> circa 41%
```

Nel complesso, la maggior parte dei modelli mantiene la stessa valutazione tra il 1977 e il 1978.

Tuttavia:

```r id="lw5q4f"
oltre 1/5 delle auto migliora la propria valutazione
circa il 10% peggiora
```

Dal confronto tra i due anni emerge un miglioramento complessivo: diminuiscono le automobili nei livelli più bassi (`1` e `2`) e aumenta la presenza di auto con valutazione `5`.

## Origine e qualità delle riparazioni

L’origine dell’automobile risulta associata alle valutazioni sulle riparazioni.

Le principali evidenze sono:

* le auto giapponesi (`J`) presentano in media le valutazioni migliori;
* le auto americane (`A`) assumono più frequentemente valori centrali, soprattutto livello `3`;
* le auto europee (`E`) mostrano valori intermedi e un miglioramento nel passaggio da `rep77` a `rep78`;
* il peggioramento tra 1977 e 1978 si osserva soltanto tra le auto di origine americana.

In particolare, nel 1978 le auto con valutazione `1` o `2` risultano tutte di origine americana, mentre oltre la metà delle automobili di origine giapponese presenta una valutazione pari a `5`.

## Relazione con le caratteristiche delle auto

Sono state analizzate diverse variabili quantitative attraverso boxplot, scatterplot e confronti tra medie e mediane.

Le principali variabili considerate sono:

```r id="ryqhi4"
price
mpg
rseat
hroom
trunk
weight
length
turn
displa
gratio
```

L’analisi evidenzia una forte correlazione tra:

```r id="6doovw"
weight
length
turn
```

Le automobili americane tendono ad avere valori più elevati di peso, lunghezza e raggio di sterzata, mentre le auto europee e giapponesi presentano generalmente valori inferiori.

È inoltre presente una relazione positiva tra:

```r id="wt13lk"
displa
weight
```

Le automobili americane sono le uniche a mostrare valori molto elevati sia di cilindrata sia di peso.

## Caratteristiche delle auto con valutazione migliore

Le automobili con valutazione `5` presentano generalmente:

```r id="xy9dwv"
rseat   -> basso
hroom   -> basso
trunk   -> basso
weight  -> basso
length  -> bassa
turn    -> basso
displa  -> bassa
mpg     -> alto
gratio  -> alto
price   -> basso
origin  -> prevalentemente J
```

Le auto meglio valutate risultano quindi tendenzialmente più leggere, compatte, meno potenti, più efficienti nei consumi e frequentemente di origine giapponese.

## Caratteristiche delle auto con valutazione peggiore

Le automobili con valutazione `1` mostrano invece:

```r id="t7sfsj"
rseat   -> basso
hroom   -> basso
trunk   -> basso
weight  -> medio
length  -> media
turn    -> medio
displa  -> media
mpg     -> basso
gratio  -> medio
price   -> basso
origin  -> prevalentemente A
```

Rispetto alle auto meglio valutate, le principali differenze riguardano quindi origine, cilindrata e consumo.

## Conclusioni

Il progetto evidenzia come le valutazioni sulla qualità delle riparazioni siano associate a caratteristiche tecniche e all’origine delle automobili.

In sintesi:

* le auto giapponesi risultano mediamente le più affidabili;
* le auto americane presentano più frequentemente valutazioni basse o intermedie;
* i modelli con valutazione migliore tendono a essere più leggeri, compatti ed efficienti nei consumi;
* tra il 1977 e il 1978 si osserva un miglioramento generale delle valutazioni;
* le variabili fisiche e meccaniche aiutano a distinguere le auto meglio valutate da quelle con valutazioni più basse.
