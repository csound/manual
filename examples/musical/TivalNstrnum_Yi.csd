<CsoundSynthesizer> 
<CsOptions> 
; Select audio/midi flags here according to platform 
-odac     ;;;realtime audio out 
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too 
; For Non-realtime ouput leave only the line below: 
; -o TivalNstrnum_Yi.wav -W ;;; for file output any platform 
</CsOptions> 
<CsInstruments> 

sr = 44100 
ksmps = 32 
nchnls = 2 
0dbfs  = 1 

;; Author: Steven Yi
;; Date: 2020.10.18
;; Description: Simple 2-sine tone with modulations and random-walk melody generation

instr Sine
ifreq = p4
iamp = p5
ipan = p6

itied = tival()
kamp = port(iamp, 0.1, (itied == 1) ? -1 : iamp)

if (itied == 0 && p3 < 0) then
kamp *= linseg(0, .1, 1, 1, 1)
elseif (itied == 1 && p3 > 0) then
kamp *= linsegr(1, 0.1, 1, 0.75, 0)
elseif (itied == 0 && p3 > 0) then
kamp *= linsegr(0, 0.5, 1, 0.75, 0)
endif

kfreq = port(ifreq, 0.1, itied == 1 ? -1 : ifreq)

;; Vibrato with delayed swell in
ivibamt = random:i(0.13, 0.17)
klfo = lfo(linseg(0, .3, 0, 1, ivibamt, 1, ivibamt), 4.7)
kmod = port(semitone(klfo), 0.01, -itied)
kfreq *= kmod

asig = oscili(1, kfreq, -1, -itied)
asig += oscili(0.15, kfreq * 2, -1, -itied)

asig *= kamp * 0.9

a1, a2 pan2 asig, ipan

out(a1, a2)
endin

;; Random Walk Melody generator
instr Run

ivoice = p4
inote_offset = limit(p5, -24, 24)
ipan = p6

print ivoice, inote_offset

inum = nstrnum("Sine") + (ivoice % 100) / 100

icount = int(random:i(4, 8))

indx = 0
istart = 0

while (indx < icount) do
idur = int(random:i(2, 5)) * .5
ilast = (indx < icount - 1) ? -1 : 1

inn = 72 + inote_offset

iamp = -18 - limit(inote_offset, 0, 24) / 2

schedule(inum, istart, idur * ilast, cpsmidinn(inn), ampdbfs(iamp), ipan)
iadj = int(random:i(2, 5))
inote_offset += (random:i(0, 1) > 0.5) ? iadj : -iadj
istart += idur
indx +=1
od

schedule(p1, istart + int(random:i(4, 8)) * .5, 0, (ivoice + 3) % 100, inote_offset, ipan)

endin

instr Main
;; run 3 voices
schedule("Run", 0, 0, 1, 0, 0.25)
schedule("Run", 0, 0, 2, 4, 0.5)
schedule("Run", 0, 0, 3, -7, 0.75)
endin

;; RUN PROJECT
seed(-1)
schedule("Main", 0, 0)
</CsInstruments> 
<CsScore> 

</CsScore> 
</CsoundSynthesizer> 