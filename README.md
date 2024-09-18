 Il pdf è disponibile nella sezione Releases a destra!


# Appunti di Linguaggi Formali e Compilatori

![logo](src/chapters/titlepage/images/logo-unitn.png)

## Indice

- [Appunti di Linguaggi Formali e Compilatori](#appunti-di-linguaggi-formali-e-compilatori)
  - [Indice](#indice)
  - [Il progetto](#il-progetto)
  - [Segnalazione errori](#segnalazione-errori)
  - [How to build](#how-to-build)
    - [Standard build chain](#standard-build-chain)
    - [How to build with LateX Workshop (VS Code)](#how-to-build-with-latex-workshop-vs-code)
    - [Build & Release automatica](#ci-build--release-automatica)
    - [Test build senza release](#test-build-senza-release)
  - [Principali pacchetti impiegati](#principali-pacchetti-impiegati)
  - [La squadra](#la-squadra)

## Il progetto

Questo testo è una dispensa di appunti scritta da studenti; lo scopo è quello di raccogliere i contenuti del corso di Linugaggi Formali e Compilatori e organizzarli secondo un'esposizione quanto più completa, efficace ed intuitiva possibile, tanto per lo studente desideroso di ottenere un'ottima padronanza degli argomenti, quanto anche per lo studente pigro in cerca di risorse per "portare a casa" l'esame.

Gli appunti sono stati presi durante il corso di Linguaggi Formali e Compilatori tenuto dalla professoressa Paola Quaglia per il Corso di Laurea in Informatica, DISI, Università degli studi di Trento, anno accademico 2020-2021. I contenuti provengono quindi primariamente dalle lezioni della professoressa, mentre invece ordine ed esposizione sono in gran parte originali. Allo stesso modo, la maggior parte degli assets (figure, grafi, tabelle, pseudocodici) sono contenutisticamente tratti dal materiale della professoressa, ma ricreati e molto spesso manipolati dagli autori; inoltre, per ottenere il risultato appena citato, è stato molto spesso necessario abbandonare quasi del tutto l'esposizione della professoressa e usarla, appunto, come canovaccio per svilupparne una originale.

Maggiori informazioni sul progetto e e sugli autori possono essere trovate nella prefazione dell'elaborato.

## Segnalazione errori

Se durante la lettura doveste incorrere in errori di qualsiasi tipo, tra gli altri errori di battitura, errori concettuali o di impaginazione, vi chiediamo di fare una segnalazione; ve ne saremo riconoscenti e provvederemo a correggere quanto prima. Se siete arrivati a questo punto assumiamo una buona familiarità con Github, per cui come canali per segnalare errori:

- aprire una Github issue, se possibile referenziando all'interno del corpo anche la porzione di codice in cui è presente l'errore
- se volete direttamente proporre un vostro fix, potete clonare la repo (istruzioni per la build [qui](#how-to-build)) e aprire una pull request con i commit che risolvono l'errore, vi daremo un riscontro quanto prima

Se preferite non segnalare l'errore tramite Github potete comunque contattarci personalmente tramite gli indirizzi email che trovate [sui nostri profili Github](#la-squadra), oppure con la mail istituzionale `nome.cognome@studenti.unitn.it`, o naturalmente con mezzi più informali.

## How to build

### Standard build chain

Prerequisiti:

- una distribuzione TeX, ad esempio [MiKTeX](https://miktex.org/) o [TeXLive](http://tug.org/texlive/)
- `pip`, per cui assicuratevi di aver installato [Python](https://www.python.org/), con le nuove versioni di Python cosiglio di utilizzare [pipx](https://github.com/pypa/pipx)
- se volete compilare utilizzando il tool [Arara](https://gitlab.com/islandoftex/arara/), allora dovrete avere una [JVM](https://www.java.com/) installata

A questo punto:

1. clonate la repository con `git clone https://github.com/unitn-drive/_EXTRA-appunti-lfc`
2. installate il pacchetto Pygments con `pip install Pygments` o `pipx install Pygments`
3. compilate, ad esempio:
   - lanciando tre volte `pdflatex -shell-escape main.tex`
   - lanciando `latexmk -pdf -shell-escape main.tex`
   - per una compilazione rapida, potete utilizzare Arara con `arara main.tex` (dovete necessariamente trovarvi nella directory `~/src/`), sarà equivalente a lanciare una sola passata di `pdflatex`

È possibile compilare singolarmente ogni capitolo e ogni asset, è sufficiente lanciare la compilazione sul singolo `.tex` desiderato.

Se lavorate con degli IDE o con degli editor in coppia con dei tool per la scrittura LaTeX (e.g. [VS Code](https://code.visualstudio.com) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) o [Atom](https://atom.io) + [latex](https://atom.io/packages/latex)), assicuratevi di attivare il flag `-shell-escape` dalle impostazioni di compilazione del vostro tool.

### How to build with LateX Workshop (VS Code)

Prerequisiti:

- [VS Code](https://code.visualstudio.com)
- [Latex Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) (estensione di VS Code)
- [TeXLive](http://tug.org/texlive/) distribuzione TeX, raccomandata dagli sviluppatori di Latex Workshop (vedi [qui](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install#requirements))

Procedimento:

1. All'interno della repo troverete il file `Appunti-LFC.code-workspace`; in questo file di configurazione sono presenti tutte le impostazioni per compilare con successo il progetto. Per farlo funzionare, è necessario che il workspace sia aperto con VS Code. (Aprire il file e premere **Open Workspace**)

2. Per compilare, basta premere `Ctrl+Alt+B` (o `Cmd+Alt+B` su Mac) se questa è la vostra shortcut, altrimenti premere il pulsante verde play (<span style="color:green;font-weight:700;font-size:20px">⊳</span>).

Nota: all'interno del di `Appunti-LFC.code-workspace` oltre lo stretto necessario sono presenti diverse opzioni (e.g. `autoBuild.run: "onSave", autoClean.run: "onBuilt"` ).
Per utilizzare queste opzioni è necessario aprire solo la cartella contenente il file `Appunti-LFC.code-workspace` e successivamente aprire il workspace.
Per disattivarle è sufficiente commentare o cancellare la riga corrispondente.
Per maggiori informazioni consultare la documentazione sui [workspaces](https://code.visualstudio.com/docs/editor/multi-root-workspaces) e per le diverse opzioni di compiling quella di [Latex Workshop](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile).

### CI: Build & Release automatica

Ogniqualvolta si effettua un commit sul `branch master` contenente dei cambiamenti all'interno della cartella src
verrà automaticamente avviato il processo di build & release, il quale compila la dispensa con l'ultima versione di Latex disponibile. I log della compilazione possono essere trovati nella pagina delle [actions](https://github.com/unitn-drive/_EXTRA-appunti-lfc/actions), nella relativa run. Dopo che la compilazione ha avuto esito positivo
verrà creata una release impostata come latest contenente il pdf, lo stesso viene caricato nel repository [linguaggi-formali-e-compilatori](https://github.com/unitn-drive/linguaggi-formali-e-compilatori), dove potete
trovare altro materiale utile.

### Test build senza release

Ogni volta che viene effettuato un push su un branch diverso dal master verrà eseguita una action con gli stessi passaggi di quella per la release ad
eccezione della pubblicazione del risultato finale. Si potrà trovare il pdf e i relativi log nella pagina dei [workflow](https://github.com/unitn-drive/_EXTRA-appunti-lfc/actions/workflows/testBuild.yml) (questi file saranno disponibili per 24 ore) cliccando sulla prima riga partendo dall'alto e recandosi nella sezione **Artifacts**.
Questo è utile per vedere come sarà il risultato finale e accorgervi di eventuali discrepanze tra la versione compilata localmente e quella che verrà pubblicata una volta mergiato il vostro branch col master.

## Principali pacchetti impiegati

- `standalone` per gestire la compilazione autonoma di capitoli e assets
- `tabularx` per la gestione delle tabelle
- `forest` per la generazione degli alberi
- `tikz` con librerie `automata` per la generazione dei grafi
- `algorithm2e` per la scrittura degli pseudocodici
- `minted` per la scrittura di codice

## La squadra

- Curatori
  - [Filippo Daniotti](https://github.com/filippodaniotti)
  - [Samuele Conti](https://github.com/samaretas)
- Scrittori
  - [Simone Alghisi](https://github.com/Simone-Alghisi)
  - [Emanuele Beozzo](https://github.com/emanuelebeozzo)
  - [Samuele Bortolotti](https://github.com/samuelebortolotti)
- Tecnici
  - [Francesco Bozzo](https://github.com/FrancescoBozzo)
  - [Federico Izzo](https://github.com/fedeizzo)
- Revisori
  - [Michele Yin](https://github.com/BigEmperor26)
  - [Giacomo Zanolli](https://github.com/civts)
- Revisori del 2023
  - [Marco Toniolo](https://github.com/Toniolo-Marco)
  - [Federico Frigerio](https://github.com/FrostWalk)
  - [Silvanus Bordignon](https://github.com/silvanusbordignon)
  - [Simone De Carli](https://github.com/Congiuntivo)
