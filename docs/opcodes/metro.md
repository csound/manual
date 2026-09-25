<!--
id:metro
category:Instrument Control:Sensing and Control
status:deprecated
-->
# metro
Trigger Metronome.

Generate a metronomic signal to be used in any circumstance an isochronous trigger is needed.

> :warning: **Deprecated in Csound 7: timing retained for compatibility**
>
> `metro` remains available for existing scores. Its historical trigger timing
> is deliberately preserved, including the behavior described below. For new
> scores, use [metro2](metro2.md) with `icorrect=1`. The default `metro2` mode
> also preserves legacy timing, so changing only the opcode name is not enough.

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

### Legacy timing at high frequencies

`metro` can emit at most one trigger per control cycle. When its phase crosses
one, it subtracts only one cycle. If `kfreq` exceeds `kr`, whole cycles can
remain in the phase state. The opcode can then keep emitting triggers after
`kfreq` drops, even when the new frequency is zero.

For example, with `kr=100` and the default initial phase, running at 250 Hz for
three control cycles and then setting the frequency to zero produces three
more triggers. This behavior is retained for backward compatibility. It must
not be changed under the `metro` name without an explicit maintainer decision.

For evenly spaced triggers in new scores, select corrected `metro2` timing:

``` csound-orc
ktrig metro2 kfreq, 0.5, 1, 0, 1
```

Here, `kswing=0.5` places offbeats midway between main beats, `iamp=1` gives both
the same amplitude, and the final argument selects `icorrect=1`. Corrected mode
keeps phase bounded at high frequencies. It still emits at most one trigger
per control cycle; it cannot represent every requested trigger above `kr`.
Review the timing when migrating an existing score rather than treating this
as a drop-in replacement.

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
