<!--
id:sequ
category:Instrument Control:Sensing and Control
-->
# sequ
Emulate a hardware sequencer.

Uses a collection of arrays to generate a sequence of events with variable tempo that can be played in forward, reverse, back and forth, and random directions. The max length of the arrays is 128, and it can be scaled dynamically. Permutational playback modes feature randomisation, probability and other algorithms.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = sequ(irhythm[], iinstr[], idata[], kbpm, klen [, kmode] [, kstep] \
                [, kreset] [, kverbose])
    kres = sequ(irhythm[], iinstr[], idata[][], kbpm, klen [, kmode] [, kstep] \
                [, kreset] [, kverbose])
    ```

=== "Classic"
    ``` csound-orc
    kres sequ irhythm[], iinstr[], idata[], kbpm, klen [, kmode] [, kstep] \
              [, kreset] [, kverbose]
    kres sequ irhythm[], iinstr[], idata[][], kbpm, klen [, kmode] [, kstep] \
              [, kreset] [, kverbose]
    ```

### Initialization

_irhythm_  - array of durations in beats.  The actual duration is determined by these values divided by the current BPM.

_iinstr_  -  array of instrument numbers scheduled per step. An instrument number zero does nothing. It skips the note associated with the step and produces a silence for that note's duration.

_idata_  -  Either a vector of p4 values to the associated iinstr step or a two dimensional array of p4, p5, p6...values.  Typically, one would specify pitch information in cps, or MIDI note number; but the arbitrary list of p4 data values could have other uses in the called iinstr.

### Performance

_kbpm_ - speed of looping in beats per minute.

_klen_ - length of the active part of the sequence (starting from step 0).

_kmode_ - control the sequencer playback. A value of 0 (default) loops forward through the sequence, calling the associated instrument on each step. Other modes are supported. (See below).

Current playback options for _kmode_ are:

* 0 - forward loop
* n&gt;0 - forward loop with a mutation every n events
* -1 - backward loop
* -2 - back and forth
* -3 - random events
* -4 - play the entire sequence forward one time and stop
* -5 - play the entire sequence backward one time and stop
* -6 - shuffle the events
* -7 - reset to the initial state

_kstep_ - if non zero replace the irhythm array with k-rate triggers. These could be from a MIDI keyboard or any other krate controller.  An event is scheduled if this argument is positive, and just waits if it is negative.  Default is zero.

_kreset_ - if non zero resets the sequencer (like mode -7). Default is zero.

_kverbose_ - if non zero prints messages about the internal state changes.  Default is zero.

_kres_ - gives the index of the event created for the current k-cycle, or -1 if no event happened.

> :memo: **Note**
>
> While the irhythm, iinstr, and idata, arrays are i-time, the values of the entries are read at k-rate when used.  This means that by using global i-rate vectors, it is possible (with care) to change the specific values and other details at performance time.

## Examples

Here is an example of the sequ opcode. It uses the file [sequ1.csd](../examples/sequ1.csd)

``` csound-csd title="Example of the sequ opcode." linenums="1"
--8<-- "examples/sequ1.csd"
```

Here is another example of the sequ opcode showing the various modes. It uses the file [sequ2.csd](../examples/sequ2.csd)

``` csound-csd title="Example of the sequ opcode." linenums="1"
--8<-- "examples/sequ2.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Written by John ffitch

New in Csound 6.17
