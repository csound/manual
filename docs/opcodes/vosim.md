<!--
id:vosim
category:Signal Generators:Granular Synthesis
-->
# vosim
Simple vocal simulation based on glottal pulses with formant characteristics.

Output is a series of sound events, where each event is composed of a burst of squared sine pulses followed by silence. The VOSIM (VOcal SIMulation) synthesis method was developed by Kaegi and Tempelaars in the 1970's.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = vosim(kamp, kFund, kForm, kDecay, kPulseCount, kPulseFactor, ifn [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ar vosim kamp, kFund, kForm, kDecay, kPulseCount, kPulseFactor, ifn [, iskip]
    ```

Intialization

_ifn_ - a sound table, normally containing half a period of a sinewave, squared (see notes below).

_iskip_ - (optional) Skip initialization, for tied notes.

### Performance

_ar_ - output signal. Note that the output is usually unipolar - positive only.

_kamp_ - output amplitude, the peak amplitude of the first pulse in each burst.

_kFund_ - fundamental pitch, in Herz. Each event is 1/kFund seconds long.

_kForm_ - formant center frequency. Length of each pulse in the burst is 1/kForm seconds.

_kDecay_ - a dampening factor from pulse to pulse. This is subtracted from amplitude on each new pulse.

_kPulseCount_ - number of pulses in the burst part of each event.

_kPulseFactor_ - the pulse width is multiplied by this value at each new pulse. This results in formant sweeping. If factor is  &lt; 1.0, the formant sweeps up, if &gt; 1.0 each new pulse is longer, so the formant sweeps down. The final pitch of the formant is kForm * pow(kPulseFactor, kPulseCount)

The output of _vosim_ is a series of sound events, where each event is composed of a burst of squared sine pulses followed by silence. The total duration of the events determines fundamental frequency. The length of each single pulse in the squared-sine bursts produce a formant frequency band. The width of the formant is determined by rate of silence to pulses (see below). The final result is also shaped by the dampening factor from pulse to pulse.

A small practical problem in using this opcode is that no GEN function will create a squared sine wave out of the box. Something like the following can be used to create the appropriate table from the score.

``` csound-sco
; use GEN09 to create half a sine in table 17
f 17 time size 9  0.5  1 0

; run instr 101 on table 17 for a single init-pass
i 101 0 0 17
```

It can also be done with an instrument writing to an f-table in the orchestra:

``` csound-orc
; square each point in table #p4. This should be run as init-only,
; just once in the performance.

instr 101
    index tableng p4
    index = index - 1  ; start from last point
loop:
    ival table index, p4
    ival = ival * ival
    tableiw ival, index, p4
    index = index - 1
    if index < 0 igoto endloop
        igoto loop
endloop:
endin
```

> :memo: **Parameter Limits**
>
> The count of pulses multiplied by pulse width should fit in the event length (1/_kFund_). If this is not fulfilled, the algorithm does not break, we just do not start any pulses that would outlast the event. This might introduce a silence at end of event even if none was intended. In consequence, _kForm_ should be higher than _kFund_, otherwise only silence is output.

_Vosim_ was created to emulate voice sounds using a model of glottal pulse. Rich sounds can be created by combining several instances of _vosim_ with different parameters. One drawback is that the signal is not band-limited. But as the authors point out, attenuation of high-pitch components is -60 dB at 6 times the fundamental frequency. The signal can also be changed by changing the source signal in the lookup table. The technique has historical interest, and can produce rich sound very cheaply (each sample requires only a table lookup and a single multiplication for attenuation).

As stated, formant bandwidth depends on the ratio between pulse burst and silence in an event. But this is not an independent parameter: The fundamental decides event length, and formant center defines the pulse length. It is therefore impossible to guarantee a specific burst/silence ratio, since the burst length has to be an integer multiple of pulse length. The decay of pulses can be used to smooth the transition from N to N+/-1 pulses, but there will still be steps in the spectral profile of output. The example code below shows one approach to this.

All input parameters are k-rate. The input parameters are only used to set up each new event (or grain). Event amplitude is fixed for each event at initialization. In normal parameter ranges, when [ksmps](../opcodes/ksmps.md) &lt;500, the k-rate parameters are updated more often than events are created. In any case, no wide-band noise will be injected in the system due to k-rate inputs being updated less often than they are read, but some other artefacts could be created.

The opcode should behave reasonably in the face of all user inputs. Some details:

1.  kFund &lt; 0: This is forced to positive - no point in "reversed" events.
2.  kFund == 0: This leads to "infinite" length event, ie a pulse burst followed by very long indefinite silence.
3.  kForm == 0: This leads to infinite length pulse, so no pulses are generated (i.e. silence).
4.  kForm &lt; 0: Table is read backward. If table is symmetric, _kform_ and -_kform_ should give bit-identical outputs.
5.  kPulseFactor == 0: Second pulse onwards is zero. See (3).
6.  kPulseFactor &lt; 0: Pulses alternately read table forward and reversed.

With asymmetric pulse table there may be some use for negative _kForm_ or negative _kPulseFactor_.

## Examples

Here is an example of the vosim opcode. It uses the file [vosim.csd](../examples/vosim.csd).

``` csound-orc title="Example of the vosim opcode." linenums="1"
--8<-- "examples/vosim.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Rasmus Ekman<br>
March 2008<br>
