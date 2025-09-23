<!--
id:shaker
category:Signal Generators:Models and Emulations
-->
# shaker
Sounds like the shaking of a maraca or similar gourd instrument.

The method is a physically inspired model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = shaker(kamp, kfreq, kbeans, kdamp, ktimes [, idecay])
    ```

=== "Classic"
    ``` csound-orc
    ares shaker kamp, kfreq, kbeans, kdamp, ktimes [, idecay]
    ```

### Initialization

_idecay_ -- If present indicates for how long at the end of the note the shaker is to be damped. The default value is zero.

### Performance

A note is played on a maraca-like instrument, with the arguments as below.

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kbeans_ -- The number of beans in the gourd. A value of 8 seems suitable.

_kdamp_ -- The damping value of the shaker. Values of 0.98 to 1 seems suitable, with 0.99 a reasonable default.

_ktimes_ -- Number of times shaken.

> :memo: **Note**
>
> The argument _knum_ was redundant, so it was removed in version 3.49.


## Examples

Here is an example of the shaker opcode. It uses the file [shaker.csd](../examples/shaker.csd).

``` csound-orc title="Example of the shaker opcode." linenums="1"
--8<-- "examples/shaker.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47
