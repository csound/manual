<!--
id:metro
category:Instrument Control:Sensing and Control
-->
# metro
Trigger Metronome.

Generate a metronomic signal to be used in any circumstance an isochronous trigger is needed.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig  = metro( kfreq [, initphase])
    ```

=== "Classic"
    ``` csound-orc
    ktrig  metro  kfreq [, initphase]
    ```

### Initialization

_initphase_  - initial phase value (in the 0 to 1 range)

### Performance

_ktrig_ - output trigger signal

_kfreq_ - frequency of trigger bangs in cps

_metro_ is a simple opcode that outputs a sequence of isochronous bangs (that is 1 values) each 1/kfreq seconds. Trigger signals can be used in any circumstance, mainly to temporize realtime algorithmic compositional structures.

> :memo: **Note**
>
> _metro_ will produce a trigger signal of 1 when its phase is exactly 0 or 1. If you want to skip the initial trigger, use a very small value like 0.00000001.

### Control-rate limit and comparison with metro2

`metro` remains supported and keeps its historical timing. Like [metro2](metro2.md), it can emit at most one trigger per control cycle, so frequencies above `kr` cannot produce every requested trigger.

When `metro`'s phase crosses one, it subtracts only one cycle. If `kfreq` exceeds `kr`, whole cycles can remain in its phase state. It can then keep emitting triggers after `kfreq` drops, even when the new frequency is zero. For example, with `kr=100` and the default initial phase, running at 250 Hz for three control cycles and then setting the frequency to zero produces three more triggers. This timing is retained for compatibility with existing scores.

`metro2` discards all completed phase cycles, so high frequencies do not leave these extra triggers after the frequency drops. It also adds swing and a separate offbeat amplitude. For evenly spaced triggers of amplitude 1, use:

``` csound-orc
ktrig metro2 kfreq, 0.5
```

Here, `kswing=0.5` places offbeats midway between main beats, and the default `iamp=1` gives both the same amplitude. No extra timing option is needed. Both opcodes still produce at most one trigger per control cycle.

Review the timing when changing an existing score from `metro` to `metro2`. In `metro`, initial phase spans one trigger interval; in `metro2`, it spans a main-beat/offbeat pair. The same nonzero initial phase therefore need not produce the same first trigger.

## Examples

Here is an example of the metro opcode. It uses the file [metro.csd](../examples/metro.csd)

``` csound-csd title="Example of the metro opcode." linenums="1"
--8<-- "examples/metro.csd"
```

Here is another example of the metro opcode. It uses the file [metro-2.csd](../examples/metro-2.csd)

``` csound-csd title="Another example of the metro opcode." linenums="1"
--8<-- "examples/metro-2.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

[metro2](metro2.md), [metrobpm](metrobpm.md)

More information on this opcode in the Floss Manuals: [https://flossmanual.csound.com/csound-language/control-structures](https://flossmanual.csound.com/csound-language/control-structures)

## Credits

Written by Gabriel Maldonado.

First Example written by Andrés Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
