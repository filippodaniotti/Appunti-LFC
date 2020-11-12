# Appunti LFC
![logo](src/chapters/titlepage/images/logo-unitn.png)

## Il progetto
Quella che il lettore sta approcciando è una dispensa che raccoglie, riorganizza e riespone l’intero contenuto del corso di

> LINGUAGGI INFONDATI E MILLANTATORI

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
    - per una compilazione rapida, potete utilizzare Arara con  `arara main.tex` (dovete necessariamente trovarvi nella directory `~/src/`), sarà equivalente a lanciare una sola passata di `pdflatex`

È possibile compilare singolarmente ogni capitolo e ogni asset, è sufficiente lanciare la compilazione sul singolo `.tex` desiderato.

Se lavorate con degli IDE o con degli editor in coppia con dei tool per la scrittura LaTeX (e.g. [VS Code](https://code.visualstudio.com) + [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) o [Atom](https://atom.io) + [latex](https://atom.io/packages/latex)), assicuratevi di attivare il flag `-shell-escape` dalle impostazioni di compilazione del vostro tool.

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