#!/bin/bash

for D in *; do
    if [[ ${D} =~ [0-9][0-9] ]]; then
        cd ${D}
        
        # file dell'ultima compilazione
        [ -d "_minted-chapter${D}" ] && rm -rf "_minted-chapter${D}"
        [ -f "chapter${D}.aux" ] && rm "chapter${D}.aux"
        [ -f "chapter${D}.synctex.gz" ] && rm "chapter${D}.synctex.gz"

        # file di metà compilazione
        [ -f "chapter${D}.log" ] && rm "chapter${D}.log"
        [ -f "chapter${D}.out" ] && rm "chapter${D}.out"
        [ -f "chapter${D}.synctex(busy)" ] && rm "chapter${D}.synctex(busy)"
        
        # file di output
        [ -f "chapter${D}.pdf" ] && rm "chapter${D}.pdf"

        # compilazione documento
        arara "chapter${D}.tex"
        
        cd ..
    fi
done