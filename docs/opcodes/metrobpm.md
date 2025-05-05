<!--
id:metrobpm
category:Instrument Control:Sensing and Control
-->
# metrobpm
Trigger Metronome with optional gate.

Generate a metronomic signal to be used in any circumstance an isochronous trigger is needed.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig  = metrobpm( kfreq [, initphase] [, kgate])
    ```

=== "Classic"
    ``` csound-orc
    ktrig  metrobpm  kfreq [, initphase] [, kgate]
    ```

### Initialization

_initphase_  - initial phase value (in the 0 to 1 range)

### Performance

_ktrig_ - output trigger signal

_kfreq_ - frequency of trigger bangs in beats per minute

_kgate_ - proportion of the cycle that the trigger held at one

_metrobpm_ is a simple opcode that outputs a sequence of isochronous bangs with optional holdin (that is 1 values,) each 60/kfreq seconds.

> :memo: **Note**
>
> _metrobpm_ will produce a trigger signal of 1 when its phase is exactly 0 or 1. If you want to skip the initial trigger, use a very small value like 0.00000001.

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Written by John ffitch

New in Csound 6.17
