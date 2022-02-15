@echo off
setlocal enableDelayedExpansion
set /p "string1=Enter the sequence to be replaced : "
set /p "string2=Enter the new sequence  : "
for %%F in (*%string1%*.*) do (
  set "filename=%%F"
  ren "!filename!" "!filename:%string1%=%string2%!"
)