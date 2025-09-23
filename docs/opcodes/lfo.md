<!--
id:lfo
category:Signal Generators:Basic Oscillators
-->
# lfo
A low frequency oscillator of various shapes.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = lfo(kamp, kcps [, itype])
    ares = lfo(kamp, kcps [, itype])
    ```

=== "Classic"
    ``` csound-orc
    kres lfo kamp, kcps [, itype]
    ares lfo kamp, kcps [, itype]
    ```

### Initialization

_itype_ (optional, default=0) -- determine the waveform of the oscillator. Default is 0.

*  _itype_ = 0 - sine
*  _itype_ = 1 - triangles
*  _itype_ = 2 - square (bipolar)
*  _itype_ = 3 - square (unipolar)
*  _itype_ = 4 - saw-tooth (unipolar - up)
*  _itype_ = 5 - saw-tooth (unipolar - down)

The sine wave is implemented as a 4096 table and linear interpolation. The others are calculated.

### Performance

_kamp_ -- amplitude of output

_kcps_ -- frequency of oscillator

## Examples

Here is an example of the lfo opcode. It uses the file [lfo.csd](../examples/lfo.csd).

``` csound-orc title="Example of the lfo opcode." linenums="1"
--8<-- "examples/lfo.csd"
```

Here is another example of the lfo opcode. It uses the file [lfo-advanced.csd](../examples/lfo-advanced.csd).

``` csound-orc title="Advanced example of the lfo opcode." linenums="1"
--8<-- "examples/lfo-advanced.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
November 1998<br>

New in Csound version 3.491
