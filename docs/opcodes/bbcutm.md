<!--
id:bbcutm
category:Signal Generators:Sample Playback
-->
# bbcutm
Generates breakbeat-style cut-ups of a mono audio stream.

The BreakBeat Cutter automatically generates cut-ups of a source audio stream in the style of drum and bass/jungle breakbeat manipulations.  There are two versions, for mono (_bbcutm_) or stereo (_bbcuts_) sources.  Whilst originally based on breakbeat cutting, the opcode can be applied to any type of source audio.

The prototypical cut sequence favoured over one bar with eighth note subdivisions would be

```
3+ 3R + 2
```

where we take a 3 unit block from the source's start, repeat it, then 2 units from the 7th and 8th eighth notes of the source.

We talk of rendering phrases (a sequence of cuts before reaching a new phrase at the beginning of a bar) and units (as subdivision the notes).

The opcode comes most alive when multiple synchronised versions are used simultaneously.

## Syntax
=== "Modern"
    ``` csound-orc
    a1 = bbcutm(asource, ibps, isubdiv, ibarlength, iphrasebars, inumrepeats \
                [, istutterspeed] [, istutterchance] [, ienvchoice ])
    ```

=== "Classic"
    ``` csound-orc
    a1 bbcutm asource, ibps, isubdiv, ibarlength, iphrasebars, inumrepeats \
              [, istutterspeed] [, istutterchance] [, ienvchoice ]
    ```

### Initialization

_ibps_ -- Tempo to cut at, in beats per second.

_isubdiv_ -- Subdivisions unit, for a bar. So 8 is eighth notes (of a 4/4 bar).

_ibarlength_ -- How many beats per bar. Set to 4 for default 4/4 bar behaviour.

_iphrasebars_ -- The output cuts are generated in phrases, each phrase is up to iphrasebars long

_inumrepeats_ --  In normal use the algorithm would allow up to one additional repeat of a given cut at a time. This parameter allows that to be changed. Value 1 is normal- up to one extra repeat. 0 would avoid repeating, and you would always get back the original source except for enveloping and stuttering.

_istutterspeed_ -- (optional, default=1) The stutter can be an integer multiple of the subdivision speed. For instance, if subdiv is 8 (quavers) and stutterspeed is 2, then the stutter is in semiquavers (sixteenth notes= subdiv 16). The default is 1.

_istutterchance_ -- (optional, default=0) The tail of a phrase has this chance of becoming a single repeating one unit cell stutter (0.0 to 1.0). The default is 0.

_ienvchoice_ -- (optional, default=1) choose 1 for on (exponential envelope for cut grains) or 0 for off. Off will cause clicking, but may give good noisy results, especially for percussive sources. The default is 1, on.

### Performance

_asource_ -- The audio signal to be cut up. This version runs in real-time without knowledge of future audio.

## Examples

=== "Modern"
    Here is a simple example of the bbcutm opcode. It uses the file [bbcutm-modern.csd](../examples/bbcutm-modern.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).
    ``` csound-orc title="A simple example of the bbcutm opcode." linenums="1"
    --8<-- "examples/bbcutm-modern.csd"
    ```

=== "Classic"
    Here is a simple example of the bbcutm opcode. It uses the file [bbcutm.csd](../examples/bbcutm.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).
    ``` csound-orc title="A simple example of the bbcutm opcode." linenums="1"
    --8<-- "examples/bbcutm.csd"
    ```

Here are some more advanced examples...

``` csound-csd title="First steps- mono and stereo versions" linenums="1"
<CsoundSynthesizer>
<CsInstruments>
sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

instr 1
asource diskin "drumsMlp.wav",1,0,1 ; a source breakbeat sample, wraparound lest it stop!

; cuts in eighth notes per 4/4 bar, up to 4 bar phrases, up to 1
; repeat in total (standard use) rare stuttering at 16 note speed,
; no enveloping
asig bbcutm asource, 2.6937, 8, 4, 4, 1, 2, 0.1, 0

outs        asig,asig
endin

instr 2 ;stereo version
asource1,asource2 diskin "drumsSlp.wav", 1, 0, 1    ; a source breakbeat sample, wraparound lest it stop!

; cuts in eighth notes per 4/4 bar, up to 4 bar phrases, up to 1
; repeat in total (standard use) rare stuttering at 16 note speed,
; no enveloping
asig1,asig2 bbcuts asource1, asource2, 2.6937, 8, 4, 4, 1, 2, 0.1, 0

outs  asig1,asig2
endin

</CsInstruments>
<CsScore>
i1 0 10
i2 11 10
e
</CsScore>
</CsoundSynthesizer>
```

``` csound-csd title="Multiple simultaneous synchronised breaks" linenums="1"
<CsoundSynthesizer>
<CsInstruments>
sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

instr 1
ibps    = 2.6937
iplaybackspeed = ibps/p5
asource diskin p4, iplaybackspeed, 0, 1

asig bbcutm asource, 2.6937, p6, 4, 4, p7, 2, 0.1, 1

outs   asig, asig
endin

</CsInstruments>
<CsScore>

;   source      bps cut repeats
i1 0 10 "drumsMlp.wav" 2.3 8   2  //2.3 is the source original tempo
i1 0 10 "beats.wav" 2.4 8   3
i1 0 10 "fox.wav" 2.5 16  4
e
</CsScore>
</CsoundSynthesizer>
```

``` csound-csd title="Cutting up any old audio- much more interesting noises than this should be possible!" linenums="1"
<CsoundSynthesizer>
<CsInstruments>
sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

instr 1
asource oscil 20000, 70, 1
; ain, bps, subdiv, barlength, phrasebars, numrepeats,
;stutterspeed, stutterchance, envelopingon
asig bbcutm asource, 2, 32, 1, 1, 2, 4, 0.6, 1
outs  asig, asig
endin

</CsInstruments>
<CsScore>
f1 0 256 10 1
i1 0 10
e
</CsScore>
</CsoundSynthesizer>
```

``` csound-csd title="Constant stuttering- faked, not possible since can only stutter in last half bar could make extra stuttering option parameter" linenums="1"
<CsoundSynthesizer>
<CsInstruments>
sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         2

instr 1
asource diskin "drumsMlp.wav", 1, 0, 1

;16th note cuts- but cut size 2 over half a beat.
;each half beat will either survive intact or be turned into
;the first sixteenth played twice in succession

asig bbcutm asource, 2, 2, 0.5, 1, 2, 2, 1.0, 0
outs  asig, asig
endin

</CsInstruments>
<CsScore>
i1 0 30
e
</CsScore>
</CsoundSynthesizer>
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Nick Collins<br>
London<br>
August 2001<br>

New in version 4.13
