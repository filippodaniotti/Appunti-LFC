@echo off

for /f "delims=" %%G in ('dir /b /s "chapter**.tex"') do (
    cd %%~pG

    @REM file dell'ultima compilazione
    if exist "_minted-%%~nG" rmdir /s /q "_minted-%%~nG"
    if exist "%%~nG.synctex.gz" del "%%~nG.synctex.gz"
    if exist "%%~nG.pdf" del "%%~nG.pdf"
    
    @REM file di metà compilazione
    if exist "%%~nG.log" del "%%~nG.log"
    if exist "%%~nG.out" del "%%~nG.out"
    if exist "%%~nG.synctex(busy)" del "%%~nG.synctex(busy)"

    @REM file di output
    if exist "%%~nG.pdf" del "%%~nG.pdf"

    @REM compilazione documento
    arara "%%~nG"
    
    cd ..
)