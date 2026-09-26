<!--
id:hilbert2
category:Signal Modifiers:Specialized Filters
-->
# hilbert2
A DFT-based implementation of a Hilbert transformer.

## Syntax
=== "Modern"
    ``` csound-orc
    c:a, s:a = hilbert2(sig:a, fftsize:i, hopsize:i)
    csig:Complex[] = hilbert2(sig:a, fftsize:i, hopsize:i)
    ```

=== "Classic"
    ``` csound-orc
    ac, as hilbert2 asig, ifftsize, ihopsize
    csig:Complex[] hilbert2 asig, ifftsize, ihopsize
    ```

### Initialization

_ifftsize_ -- FFT size in samples, at least 2. Csound rounds this down to a power of two. Below, _N_ means the rounded FFT size.

_ihopsize_ -- number of samples between analysis frames, at least 1. Csound rounds this down to a power of two, then limits it to _N_. A smaller hop gives more overlap and uses more processing time.

For example, an FFT size of 150 and a hop size of 35 become 128 and 32.

### Performance

_sig_ -- input signal

_c_ -- real (cosine) output: a delayed copy of _sig_.

_s_ -- imaginary (sine) output: an approximation of the Hilbert transform of _sig_.

_csig_ -- Complex array containing the same real and imaginary outputs, with one element per sample in the current control block.

_hilbert2_ uses FFT processing to produce two outputs in quadrature (a 90-degree phase difference). The approximation is less accurate near DC and Nyquist (_sr_/2). Steady DC and Nyquist components have zero imaginary output.

Both outputs have a delay of _N_ samples, or _N_/_sr_ seconds. This uses the rounded FFT size, not the requested size.

## Examples

Here is an example of the hilbert2 opcode. It uses the file [hilbert2.csd](../examples/hilbert2.csd).

``` csound-csd title="Example of the hilbert2 opcode." linenums="1"
--8<-- "examples/hilbert2.csd"
```

## See also

[hilbert](hilbert.md), [Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
