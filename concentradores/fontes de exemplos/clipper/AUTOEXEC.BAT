@ECHO OFF
PROMPT $p$g
PATH C:\;C:\WINDOWS;C:\WINDOWS\COMMAND;

SET CLIPPER=//F:255 //SWAPPATH:"C:\WINDOWS\TEMP"

REM OBS: Quando necessitar executar qualquer programa pelo autoexec.bat,
REM      utilize um LH antes do caminho.  Com isso o programa sera executado
REM      em memoria alta.  EX.: LH C:\SIGMA\MRGER_HW.EXE
REM =========================================================================

MODE CON:RATE=32 DELAY=1
SET DIRCMD=/O
CLS
