<!--
id:pinker
category:Signal Generators:Random (Noise) Generators
-->
# pinker
Generates pink noise (-3dB/oct response) by the _NewShade of Pink_ algorithm of Stefan Stenzel.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pinker()
    ```

=== "Classic"
    ``` csound-orc
    ares pinker
    ```

### Performance

_pinker_ generates pink noise (i.e., noise with equal energy in each octave), by the algorithm of Stefan Stenzel.  For details of the algorithm look at [http://stenzel.waldorfmusic.de/post/pink/](http://stenzel.waldorfmusic.de/post/pink/).

## Examples

Here is an example of the pinker opcode. It uses the file [pinker.csd](../examples/pinker.csd).

``` csound-orc title="Example of the pinker opcode." linenums="1"
--8<-- "examples/pinker.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Authors: Stefan Stenzel and John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2014<br>

New in Csound Version 6.04
