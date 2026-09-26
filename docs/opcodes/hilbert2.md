<!--
id:hilbert2
category:Signal Modifiers:Specialized Filters
-->
# hilbert2
A DFT-based implementation of a Hilbert transformer.

## Syntax
=== "Modern"
    ``` csound-orc
    c:a, s:a = hilbert2(sig:a, dftsize:i, hopsize:i)
    csig:Complex[] = hilbert2(sig:a, dftsize:i, hopsize:i)
    ```

=== "Classic"
    ``` csound-orc
    ac, as hilbert2 asig, idftsize, ihopsize
    csig:Complex[] hilbert2 asig, idftsize, ihopsize
    ```

### Initialization

_idftsize_ -- DFT size in samples, at least 2. Csound rounds this down to a power of two. Below, _N_ means the rounded DFT size.

_ihopsize_ -- number of samples between analysis frames, at least 1. Csound rounds this down to a power of two, then limits it to _N_. A smaller hop gives more overlap and uses more processing time.

For example, a DFT size of 150 and a hop size of 35 become 128 and 32.

### Performance

_sig_ -- input signal

_c_ -- cosine output of _sig_

_s_ -- sine output of _sig_

_csig_ -- Complex array containing the analytic signal.

_hilbert2_ is a DFT-based implementation of the Hilbert Transform producing two outputs in quadrature (90 degree phase difference across the spectrum). Unlike the IIR-based _hilbert_ opcode, _hilbert2_ has a linear frequency response. Its streaming algorithm adds a delay equal to the DFT size in samples.

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
