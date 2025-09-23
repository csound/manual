<!--
id:jitter
category:Signal Generators:Random (Noise) Generators
-->
# jitter
Generates a segmented line whose segments are randomly generated.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = jitter(kamp, kcpsMin, kcpsMax)
    ```

=== "Classic"
    ``` csound-orc
    kout jitter kamp, kcpsMin, kcpsMax
    ```

### Performance

_kamp_ -- Amplitude of jitter deviation

_kcpsMin_ -- Minimum speed of random frequency variations (expressed in cps)

_kcpsMax_ -- Maximum speed of random frequency variations (expressed in cps)

_jitter_ generates a segmented line whose segments are randomly generated inside the +kamp and -kamp interval. Duration of each segment is a random value generated according to kcpsmin and kcpsmax values.

_jitter_ can be used to make more natural and &#8220;analog-sounding&#8221; some static, dull sound. For best results, it is suggested to keep its amplitude moderate.

## Examples

Here is an example of the jitter opcode. It uses the file [jitter.csd](../examples/jitter.csd).

``` csound-orc title="Example of the jitter opcode." linenums="1"
--8<-- "examples/jitter.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.15
