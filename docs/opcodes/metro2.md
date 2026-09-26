<!--
id:metro2
category:Instrument Control:Sensing and Control
-->
# metro2
Trigger Metronome with Swing and Accents.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig  = metro2( kfreq, kswing [, iamp, initphase])
    ```

=== "Classic"
    ``` csound-orc
    ktrig  metro2  kfreq, kswing [, iamp, initphase]
    ```

### Initialization

_iamp_ (optional, default=1) -- offbeat trigger amplitude

_initphase_ (optional, default=0) -- initial phase within a main-beat/offbeat pair, normally between 0 and 1. It must be finite and nonnegative. Values of 1 or more are reduced to their fractional part with a warning.

### Performance

_ktrig_ - output trigger signal

_kfreq_ - frequency of trigger bangs in cps. It must be finite and nonnegative. A main-beat/offbeat pair takes `2/kfreq` seconds when the frequency is positive and constant.

_kswing_ - offbeat position within each pair, in the 0 to 1 range. A value of 0.5 places the offbeat midway between main beats; larger values delay it and smaller values bring it forward.

`metro2` adds swing and accents to [metro](metro.md). Main beats have amplitude 1; offbeats use `iamp`. For example, `ktrig metro2 4, .65, -1` produces main beats of 1 and offbeats of -1. For evenly spaced triggers of amplitude 1, use `ktrig metro2 kfreq, 0.5`.

The main and offbeat clocks advance together. The initial swing comes from its first control-rate value. A nonzero initial phase skips an offbeat that has already passed. At phase zero, the initial trigger is 1, including when swing places both beats at the same point. If both beats occur in a later control cycle, the offbeat amplitude takes precedence.

### Control-rate limit and comparison with metro

`metro2` accepts frequencies above `kr` and discards all completed phase cycles. High frequencies therefore do not leave whole cycles that cause extra triggers after the frequency drops to zero. This timing is always active; no extra argument is needed.

Both `metro2` and `metro` can emit at most one trigger per control cycle. Accepting a frequency above `kr` does not allow `metro2` to represent every requested trigger. To resolve every beat, choose a control rate high enough for the shortest interval between main beats and offbeats.

`metro` remains supported and keeps its historical timing for compatibility. It subtracts only one completed phase cycle per trigger, so frequencies above `kr` can leave extra triggers after the frequency drops. Its initial phase spans one trigger interval, while `metro2`'s spans a main-beat/offbeat pair. Check startup timing when moving an existing score between them.

Csound 7 uses the timing described here for all `metro2` calls. Earlier versions could offset the main and offbeat clocks by one control cycle and emit an offbeat that had already passed at startup. Existing `metro2` scores may therefore have different startup and swing timing.

> :memo: **Note**
>
> _metro2_ as well as _metro_ will produce a trigger signal of 1 when its phase is exactly 0 or 1. If you want to skip the initial trigger, use a very small value like 0.00000001.

## Examples

Here is an example of the metro2 opcode. It uses the file [metro2.csd](../examples/metro2.csd)

``` csound-csd title="Example of the metro2 opcode." linenums="1"
--8<-- "examples/metro2.csd"
```

This example starts after the first offbeat and prints `1` for main beats and `-1` for offbeats. It uses [metro2_corrected.csd](../examples/metro2_corrected.csd):

``` csound-csd title="metro2 with a nonzero initial phase" linenums="1"
--8<-- "examples/metro2_corrected.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

[metro](metro.md), [metrobpm](metrobpm.md)

## Credits

Author: Gleb Rogozinsky;<br>
St.Petersburg, October 2019<br>

New in Csound version 6.14
