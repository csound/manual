<!--
id:lowres
category:Signal Modifiers:Standard Filters:Resonant
-->
# lowres
Another resonant lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lowres(asig, xcutoff, xresonance [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares lowres asig, xcutoff, xresonance [, iskip]
    ```

### Initialization

_iskip_ -- initial disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_xcutoff_ -- filter cutoff frequency point

_xresonance_ -- resonance amount

_lowres_ is a resonant lowpass filter derived from a Hans Mikelson orchestra. This implementation is much faster than implementing it in Csound language, and it allows _kr_ lower than _sr_. _xcutoff_ is not in Hz and _xresonance_ is not in dB, so experiment for the finding best results.

## Examples

Here is an example of the lowres opcode. It uses the file [lowres.csd](../examples/lowres.csd).

``` csound-csd title="Example of the lowres opcode." linenums="1"
--8<-- "examples/lowres.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49
