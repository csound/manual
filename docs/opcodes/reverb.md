<!--
id:reverb
category:Signal Modifiers:Reverberation
-->
# reverb
Reverberates an input signal with a &#8220;natural room&#8221; frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = reverb(asig, krvt [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares reverb asig, krvt [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (cf. [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_krvt_ -- the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).

A standard _reverb_ unit is composed of four [comb](../opcodes/comb.md) filters in parallel followed by two [alpass](../opcodes/alpass.md) units in series. Loop times are set for optimal &#8220;natural room response.&#8221; Core storage requirements for this unit are proportional only to the sampling rate, each unit requiring approximately 3K words for every 10KC. The [comb](../opcodes/comb.md), [alpass](../opcodes/alpass.md), [delay](../opcodes/delay.md), [tone](../opcodes/tone.md) and other Csound units provide the means for experimenting with alternate reverberator designs.

Since output from the standard _reverb_ will begin to appear only after 1/20 second or so of delay, and often with less than three-fourths of the original power, it is normal to output both the source and the reverberated signal. If _krvt_ is inadvertently set to a non-positive number, _krvt_ will be reset automatically to 0.01. (New in Csound version 4.07.) Also, since the reverberated sound will persist long after the cessation of source events, it is normal to put _reverb_ in a separate instrument to which sound is passed via a _global variable_, and to leave that instrument running throughout the performance.

## Examples

Here is an example of the reverb opcode. It uses the file [reverb.csd](../examples/reverb.csd).

``` csound-csd title="Example of the reverb opcode." linenums="1"
--8<-- "examples/reverb.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: William &#8220;Pete&#8221; Moss<br>
University of Texas at Austin<br>
Austin, Texas USA<br>
January 2002<br>
