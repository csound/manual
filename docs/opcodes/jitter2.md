<!--
id:jitter2
category:Signal Generators:Random (Noise) Generators
-->
# jitter2
Generates a segmented line with user-controllable random segments.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = jitter2(ktotamp, kamp1, kcps1, kamp2, kcps2, kamp3, kcps3[ , iopt])
    ```

=== "Classic"
    ``` csound-orc
    kout jitter2 ktotamp, kamp1, kcps1, kamp2, kcps2, kamp3, kcps3[ , iopt]
    ```

Initialisation

_iopt_ -- Optional, controls time of onset of effects.  If zero (default) the output is zero until the end of the shortest kcps value.  If not zero the effect starts
immediately

### Performance

_ktotamp_ -- Resulting amplitude of jitter2

_kamp1_ -- Amplitude of the first jitter component

_kcps1_ -- Speed of random variation of the first jitter component (expressed in cps)

_kamp2_ -- Amplitude of the second jitter component

_kcps2_ -- Speed of random variation of the second jitter component (expressed in cps)

_kamp3_ -- Amplitude of the third jitter component

_kcps3_ -- Speed of random variation of the third jitter component (expressed in cps)

_jitter2_ also generates a segmented line such as [jitter](../opcodes/jitter.md), but in this case the result is similar to the sum of three _randi_ opcodes, each one with a different amplitude and frequency value (see [randi](../opcodes/randi.md) for more details), that can be varied at k-rate. Different effects can be obtained by varying the input arguments.

_jitter2_ can be used to make more natural and &#8220;analog-sounding&#8221; some static, dull sound. For best results, it is suggested to keep its amplitude moderate.

## Examples

Here is an example of the jitter2 opcode. It uses the file
[jitter2.csd](../examples/jitter2.csd).

``` csound-orc title="Example of the jitter2 opcode." linenums="1"
--8<-- "examples/jitter2.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Gabriel Maldonado, John ffitch

New in Version 4.15

iopt new in version 6.08
