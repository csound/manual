<!--
id:lowresx
category:Signal Modifiers:Standard Filters:Resonant
-->
# lowresx
Simulates layers of serially connected resonant lowpass filters.


## Syntax
=== "Modern"
    ``` csound-orc
    ares = lowresx(asig, xcutoff, xresonance [, inumlayer] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares lowresx asig, xcutoff, xresonance [, inumlayer] [, iskip]
    ```

### Initialization

_inumlayer_ -- number of filters in the stack, from 1 to 10. The default is 4.

_iskip_ -- initial disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_xcutoff_ -- positive cutoff control, not in Hz.

_xresonance_ -- positive resonance control, not in dB.

_lowresx_ connects several [lowres](../opcodes/lowres.md) filters in series, all with the same cutoff and resonance. More filters give a sharper cutoff. Based on an orchestra by Hans Mikelson.

## Examples

Here is an example of the lowresx opcode. It uses the file [lowresx.csd](../examples/lowresx.csd).

``` csound-csd title="Example of the lowresx opcode." linenums="1"
--8<-- "examples/lowresx.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49

Audio rate parameters introduced in version 6.02

November 2013.
