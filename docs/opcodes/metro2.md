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

_iamp_  -  off-beat click amplitude

_initphase_  - initial phase value (in the 0 to 1 range)

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

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Gleb Rogozinsky;<br>
St.Petersburg, October 2019<br>

New in Csound version 6.14
