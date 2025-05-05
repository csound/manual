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

_inumlayer_ -- number of elements in a _lowresx_ stack. Default value is 4. There is no maximum.

_iskip_ -- initial disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_xcutoff_ -- filter cutoff frequency point

_xresonance_ -- resonance amount

_lowresx_ is equivalent to more layer of [lowres](../opcodes/lowres.md) with the same arguments serially connected. Using a stack of a larger number of filters allows a sharper cutoff. This is faster than using a larger number of instances of _lowres_ in a Csound orchestra because only one initialization and k cycle are needed at time and the audio loop falls entirely inside the cache memory of processor. Based on an orchestra by Hans Mikelson

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
