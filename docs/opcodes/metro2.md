<!--
id:metro2
category:Instrument Control:Sensing and Control
-->
# metro2
Trigger Metronome with Swing and Accents.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig  = metro2( kfreq, kswing [, iamp, initphase, icorrect])
    ```

=== "Classic"
    ``` csound-orc
    ktrig  metro2  kfreq, kswing [, iamp, initphase, icorrect]
    ```

### Initialization

_iamp_ (optional, default=1) -- offbeat trigger amplitude

_initphase_ (optional, default=0) -- initial phase value, normally between 0 and 1.

_icorrect_ (optional, default=0) -- zero preserves the original timing, including startup offbeats and the one-control-cycle offset between the two clocks. Set to 1 for corrected timing: both clocks advance together, the initial swing comes from its first control-rate value, and a nonzero initial phase does not emit an offbeat that has already passed. Corrected mode requires a finite, nonnegative frequency and initial phase, and swing between 0 and 1.

For example, `ktrig metro2 4, .65, -1, 0, 1` selects corrected timing, with `1` for main beats and `-1` for offbeats.

### Performance

_ktrig_ - output trigger signal

_kfreq_ - frequency of trigger bangs in cps

_kswing_ - value (in the 0 to 1 range)

_metro2_ is a modification of 'classic' _metro_ opcode with additional swinging. The swinging clicks can be modulated at k-rate. Also, swinging clicks can have their own amplitude value set by iamp.

> :memo: **Note**
>
> _metro2_ as well as _metro_ will produce a trigger signal of 1 when its phase is exactly 0 or 1. If you want to skip the initial trigger, use a very small value like 0.00000001.

## Examples

Here is an example of the metro2 opcode. It uses the file [metro2.csd](../examples/metro2.csd)

``` csound-csd title="Example of the metro2 opcode." linenums="1"
--8<-- "examples/metro2.csd"
```

Here is another example of the metro2 Opcode. It uses the file [metro2_corrected](../examples/metro2_corrected.csd). It selects corrected timing and starts after the first offbeat. It prints `1` for main beats and `-1` for offbeats:

``` csound-csd title="Corrected metro2 timing" linenums="1"
--8<-- "examples/metro2_corrected.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Gleb Rogozinsky;<br>
St.Petersburg, October 2019<br>

New in Csound version 6.14
