<!--
id:repluck
category:Signal Generators:Waveguide Physical Modeling
-->
# repluck
Physical model of the plucked string.

A user can control the pluck point, the pickup point, the filter, and an additional audio signal, _axcite_. _axcite_ is used to excite the 'string'. Based on the Karplus-Strong algorithm.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = repluck(iplk, kamp, icps, kpick, krefl, axcite)
    ```

=== "Classic"
    ``` csound-orc
    ares repluck iplk, kamp, icps, kpick, krefl, axcite
    ```

### Initialization

_iplk_ -- The point of pluck is _iplk_, which is a fraction of the way up the string (0 to 1). A pluck point of zero means no initial pluck.

_icps_  -- The string plays at _icps_ pitch.

### Performance

_kamp_ -- Amplitude of note.

_kpick_ -- Proportion of the way along the string to sample the output.

_krefl_ -- the coefficient of reflection, indicating the lossiness and the rate of decay. It must be strictly between 0 and 1 (it will complain about both 0 and 1).

### Performance

_axcite_ -- A signal which excites the string.

## Examples

Here is an example of the repluck opcode. It uses the file [repluck.csd](../examples/repluck.csd).

``` csound-csd title="Example of the repluck opcode." linenums="1"
--8<-- "examples/repluck.csd"
```

Here is another example of the repluck opcode. It uses the file [repluck-advanced.csd](../examples/repluck-advanced.csd).

``` csound-csd title="Advanced example of the repluck opcode." linenums="1"
--8<-- "examples/repluck-advanced.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
1997<br>

New in version 3.47
