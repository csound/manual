<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

instr ReadLabels
  SLine, kStatus = readline("Label or quit> ")
  if kStatus == 1 then
    kQuit = strcmpk(SLine, "quit")
    if kQuit == 0 then
      exitnowk(0)
    else
      printks "Received <%s>\n", 0, SLine
    endif
  elseif kStatus == -1 then
    printks "Input ended\n", 0
    exitnowk(0)
  endif

  // Silent audio keeps the terminal session at real-time speed.
  aSilence = 0
  out(aSilence)
endin
</CsInstruments>
<CsScore>
i "ReadLabels" 0 60
e
</CsScore>
</CsoundSynthesizer>
