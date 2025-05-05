<!--
id:wgpluck2
category:Signal Generators:Waveguide Physical Modeling
-->
# wgpluck2
Physical model of the plucked string.

It has control over the pluck point, the pickup point and the filter. Based on the Karplus-Strong algorithm.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgpluck2(iplk, kamp, icps, kpick, krefl)
    ```

=== "Classic"
    ``` csound-orc
    ares wgpluck2 iplk, kamp, icps, kpick, krefl
    ```

### Initialization

_iplk_ -- The point of pluck is _iplk_, which is a fraction of the way up the string (0 to 1). A pluck point of zero means no initial pluck.

_icps_  -- The string plays at _icps_ pitch.

### Performance

_kamp_ -- Amplitude of note.

_kpick_ -- Proportion of the way along the string to sample the output.

_krefl_ -- the coefficient of reflection, indicating the lossiness and the rate of decay. It must be strictly between 0 and 1 (it will complain about both 0 and 1).

## Examples

Here is an example of the wgpluck2 opcode. It uses the file [wgpluck2.csd](../examples/wgpluck2.csd).

``` csound-csd title="Example of the wgpluck2 opcode." linenums="1"
--8<-- "examples/wgpluck2.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
