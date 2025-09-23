<!--
id:mandol
category:Signal Generators:Models and Emulations
-->
# mandol
An emulation of a mandolin.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = mandol(kamp, kfreq, kpluck, kdetune, kgain, ksize \
                  [, ifn] [, iminfreq])
    ```

=== "Classic"
    ``` csound-orc
    ares mandol kamp, kfreq, kpluck, kdetune, kgain, ksize \
                [, ifn] [, iminfreq]
    ```

### Initialization

_ifn_ -- table number containing the pluck wave form. The file [mandpluk.aiff](../examples/mandpluk.aiff) is suitable for this. It is also available at [ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/](ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/).

_iminfreq_ (optional, default=0) -- Lowest frequency to be played on the note. If it is omitted it is taken to be the same as the initial _kfreq_.

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kpluck_ -- The pluck position, in range 0 to 1. Suggest 0.4.

_kdetune _ -- The proportional detuning between the two strings. Suggested range 0.9 to 1.

_kgain_ -- the loop gain of the model, in the range 0.97 to 1.

_ksize_ -- The size of the body of the mandolin. Range 0 to 2.

## Examples

Here is an example of the mandol opcode. It uses the file [mandol.csd](../examples/mandol.csd), and [mandpluk.aiff](../examples/mandpluk.aiff).

``` csound-orc title="Example of the mandol opcode." linenums="1"
--8<-- "examples/mandol.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
