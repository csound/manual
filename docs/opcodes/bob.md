<!--
id:bob
category:Signal Modifiers:Standard Filters:Resonant
-->
# bob
Runge-Kutte numerical simulation of the Moog analog resonant filter.

Bob is based on bob~ by Miller Puckette in Pure Data. The design is based on the papers by Tim Stilson, Timothy E. Stinchcombe, and Antti Huovilainen.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = bob(ain, xcf, xres, xsat [, iosamps, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig bob ain, xcf, xres, xsat [, iosamps, istor]
    ```

### Initialization

_iosamps_ -- number of times of oversampling used in the filtering process. This will determine the maximum sharpness of the filter resonance (Q). More oversampling allows higher Qs, less oversampling will limit the resonance. The default is 2 times (iosamps=0).

_istor_ -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_xcf_ -- filter cutoff frequency

_xres_ -- filter resonance. Nominally, a value of 4 should be the limit of stability -- above that, the filter oscillates.

_xsat_ --  saturation. This parameter determines at what signal level the "transistors" in the model saturate. The maximum output amplitude is about 2/3 of that value.

According to bob~ manual page, "By default bob~ does one step of 4th-order Runge-Kutte integration per audio sample. This works OK for resonant/cutoff frequencies up to about 1/2 Nyquist. To improve accuracy and/or to extend the range of the filter to higher cutoff frequencies you can oversample by any factor - but note that computation time rises accordingly. At high cutoff frequencies/resonance values the RK approximation can go unstable. You can combat this by raising the oversampling factor.
The saturation parameter determines at what signal level the "transistors" in the model saturate. The maximum output amplitude is about 2/3 of that value".

## Examples

=== "Modern"
    Here is an example of the bob opcode. It uses the file [bob-modern.csd](../examples/bob-modern.csd).
    ``` csound-csd title="Example of the bob opcode." linenums="1"
    --8<-- "examples/bob-modern.csd"
    ```

=== "Classic"
    Here is an example of the bob opcode. It uses the file [bob.csd](../examples/bob.csd).
    ``` csound-csd title="Example of the bob opcode." linenums="1"
    --8<-- "examples/bob.csd"
    ```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

By: Gleb Rogozinsky 2020

New in version 6.15
