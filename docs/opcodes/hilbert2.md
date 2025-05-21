<!--
id:hilbert2
category:Signal Modifiers:Specialized Filters
-->
# hilbert2
A DFT-based implementation of a Hilbert transformer.

## Syntax
=== "Modern"
    ``` csound-orc
    c:a, s:a = hilbert2(sig:a, fftsize:a, hopsize:i)
    csig:Complex[] = hilbert2(sig:a, fftsize:a, hopsize:i)    
    ```

=== "Classic"
    ``` csound-orc
    ac, as hilbert2 asig, ifftsize, ihopsize
    csig:Complex[] hilbert2 asig, ifftsize, ihopsize    
    ```

Initialisation

_ifftsize_ -- DFT analysis size

_ihopsize_ -- analysis hopsize

### Performance

_sig_ -- input signal

_c_ -- cosine output of _sig_

_s_ -- sine output of _sig_

_csig_ -- Complex array containing the analytic signal.

_hilbert2_ is a DFT-based implementation of the Hilbert Transform producing two outputs in quadrature (90 degree phase difference across the spectrum). Unlike the IIR-based _hilbert_ opcode, _hilbert2_ has a linear frequency response. Given that it employs a streaming algorithm, a delay of fftsize samples will be imposed between input and output.

## Examples

Here is an example of the hilbert2 opcode. It uses the file [hilbert2.csd](../examples/hilbert2.csd).

``` csound-csd title="Example of the hilbert2 opcode." linenums="1"
--8<-- "examples/hilbert2.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Victor Lazzarini<br>
2017<br>
