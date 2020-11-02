# Latex cleaner
A simple `python` script that removes junk files of `pdftex` compilation.

## How to run

Just call it with a `python` interpreter (must be `python 3.x`, won't work with version `2.7`) **while being in the project root folder**, like this:

```
~/Appunti-LFC$ python ./util/cleaner.py
```

This way, for each subfolder in the `src` directory, all the files that match one of the following will be deleted:

- `_minted*`
- `*.aux`
- `*.dvi`
- `*.fdb_latexmk`
- `*.fls`
- `*.log`
- `*.out`
- `*.sta`
- `*.toc`

Add flag `-a` for a total clean up:

```
~/Appunti-LFC$ python ./util/cleaner.py -a
```

This way the following pattern will be added to the list and therefore all their matches removed:

- `*.pdf`
- `*.synctex.gz`