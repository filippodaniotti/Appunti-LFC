# Appunti LFC

![logo](src/chapters/titlepage/images/logo-unitn.png)

## Il progetto

Quella che il lettore sta approcciando è una dispensa che raccoglie, riorganizza e riespone l’intero contenuto del corso di

> LINGUAGGI, COMPARI E SOVVERTITORI

tenuto nell’Università degli studi di Trento durante il primo semestre dell’anno accademico 2020/2021. L'elaborato è stato suddiviso in capitoli che seguono il partizionamento proposto dalla professoressa e, successivamente, in sezioni e sottosezioni per questioni di agilità consultativa. I singoli argomenti vengono presentati nell'ordine e modalità proposti dalla professoressa (all'infuori di sporadici casi in cui gli autori hanno proposto una maniera da loro ritenuta più fruibile per il target di riferimento), corredati da immagini e codici commentati dove possibile.

## How to build

Prerequisiti:

- una distribuzione TeX, ad esempio [MiKTeX](https://miktex.org/) o [TeXLive](http://tug.org/texlive/)
- `pip`, per cui assicuratevi di aver installato [Python](https://www.python.org/)
- se volete compilare utilizzando il tool [Arara](https://gitlab.com/islandoftex/arara/), allora dovrete avere una [JVM](https://www.java.com/) installata

A questo punto:

1. clonate la repository con `git clone https://github.com/filippodaniotti/Appunti-LFC`
2. installate il pacchetto Pygments con `pip install Pygments`
3. compilate, ad esempio:
   - lanciando tre volte `pdflatex -shell-escape main.tex`
   - lanciando `latexmk -pdf -shell-escape main.tex`
   - per una compilazione rapida, potete utilizzare Arara con `arara main.tex` (dovete necessariamente trovarvi nella directory `~/src/`), sarà equivalente a lanciare una sola passata di `pdflatex`

È possibile compilare singolarmente ogni capitolo e ogni asset, è sufficiente lanciare la compilazione sul singolo `.tex` desiderato.

Se lavorate con degli IDE o con degli editor in coppia con dei tool per la scrittura LaTeX (e.g. [VS Code](https://code.visualstudio.com) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) o [Atom](https://atom.io) + [latex](https://atom.io/packages/latex)), assicuratevi di attivare il flag `-shell-escape` dalle impostazioni di compilazione del vostro tool.

## Alternative building: Docker

Se non disponete dei prerequisiti per la build indicati sopra (o non volete installarli system-wide), potete
buildare con docker.  
Se poi avete sia [VS Code](https://code.visualstudio.com) che [docker](https://www.docker.com/), potete riferirvi a questo [gist](https://gist.github.com/civts/234f4e7be7d13df676937996f4d4f45c) per una configurazione già pronta.

Prerequisiti:

- [docker](https://www.docker.com/)
- almeno 5/6GB liberi su disco

Procedimento:

1. clonate la repository con `git clone https://github.com/filippodaniotti/Appunti-LFC`
2. se non siete su linux, buildate l'immagine docker contenuta nel Dockerfile con `docker build -t dispensa_lfc .`  
   Nel caso siate su linux, usate questo comando per buildare `docker build -t dispensa_lfc --build-arg UID=$(id -u) --build-arg GID=$(id -g) .` (si assicura che il vostro userId e groupId corrispondano a quelli che il container userà)
3. avviate un container, ricordandovi di montare la cartella della dispensa.  
Esempio: `docker run -ti --rm -v $(pwd):/dispensa --name dispensa_lfc dispensa_lfc`
4. ora avete accesso ad un ambiente con tutte le dipendenze installate e potete buildare usando i comandi della sezione [how to build](#How-to-build) (ad eccezione di Arara, poiché il container non ha una JVM installata).

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
