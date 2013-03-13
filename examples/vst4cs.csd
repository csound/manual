<CsoundSynthesizer>
<CsOptions>
; Credits: Adapted by Michael Gogins 
; from code by David Horowitz and Lian Cheung. 
; The "--displays" option is required in order for 
; the Pianoteq GUI to dispatch events and display properly.
-m3 --displays -odac
</CsOptions>
<CsInstruments>
sr     = 44100
ksmps  = 20
nchnls = 2
                ; Load the Pianoteq into memory.
gipianoteq      vstinit         "C:\\Program Files\\Steinberg\\VstPlugins\\Pianoteq 3.0 Trial\\Pianoteq30 Trial.dll", 1
                
                ; Print information about the Pianoteq, such as parameter names and numbers.
                vstinfo         gipianoteq
                
                ; Open the Pianoteq's GUI.
                vstedit         gipianoteq

                ; Send notes from the score to the Pianoteq.
                instr 1 
                ; MIDI channels are numbered starting at 0.
                ; p3 always contains the duration of the note.
                ; p4 contains the MIDI key number (pitch),
                ; p5 contains the MIDI velocity number (loudness),
imidichannel    init            0
                vstnote         gipianoteq, imidichannel, p4, p5, p3
                endin

                ; Send parameter changes to the Pianoteq.
                instr 2 
                ; p4 is the parameter number.
                ; p5 is the parameter value.
                vstparamset     gipianoteq, p4, p5 
                endin

                ; Send audio from the Pianoteq to the output.
                instr 3 
ablankinput     init            0
aleft, aright   vstaudio        gipianoteq, ablankinput, ablankinput
                outs            aleft, aright
                endin

</CsInstruments>
<CsScore>
; Turn on the instrument that receives audio from the Pianoteq indefinitely.
i 3 0 -1
; Send parameter changes to Pianoteq before sending any notes.
; NOTE: All parameters must be between 0.0 and 1.0.
; Length of piano strings:
i 2 0 1 33 0.5
; Hammer noise:
i 2 0 1 25 0.1
; Send a C major 7th arpeggio to the Pianoteq.
i 1 1 10 60 76
i 1 2 10 64 73
i 1 3 10 67 70 
i 1 4 10 71 67
; End the performance, leaving some time 
; for the Pianoteq to finish sending out its audio,
; or for the user to play with the Pianoteq virtual keyboard.
e 20
</CsScore>
</CsoundSynthesizer>
