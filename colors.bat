@echo off
setlocal EnableDelayedExpansion

rem Hex digits for indexing
set "hex=0123456789ABCDEF"

:loop
  rem pick random 0–15 for fg and bg
  set /a fgRand=%random% %% 16
  set /a bgRand=%random% %% 16

  rem retry if same (so text remains visible)
  if %fgRand%==%bgRand% goto loop

  rem map to hex digit
  set "fg=!hex:~%fgRand%,1!"
  set "bg=!hex:~%bgRand%,1!"

  rem apply color and clear
  color %bg%%fg%
  cls
  echo I HAVE FULL ACCESS TO YOUR COMPUTER
  echo (seizure warning)

  rem ~1 second delay via ping
  ping -n 2 127.0.0.1 >nul

goto loop
