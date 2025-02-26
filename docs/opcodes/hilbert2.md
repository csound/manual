<!--
id:hilbert2
category:Signal Modifiers:Specialized Filters
-->
# hilbert2
A DFT-based implementation of a Hilbert transformer.

## Syntax
``` csound-orc
ar1, ar2 hilbert2 asig, ifftsize, ihopsize
```

Initialisation

_ifftsize_ -- DFT analysis size

_ihopsize_ -- analysis hopsize

### Performance

_asig_ -- input signal

_ar1_ -- real output of _asig_

_ar2_ -- imag output of _asig_

_hilbert2_ is a DFT-based implementation of the Hilbert Transform producing two outputs in quadrature (90 degree phase difference across the spectrum). Unlike the IIR-based _hilbert_ opcode, _hilbert2_ has a linear frequency response. Given that it employs a streaming algorithm, a delay of fftsize samples will be imposed between input and output.

Example

Here is an example of the hilbert2 opcode. It uses the file [hilbert2.csd](../../examples/hilbert2.csd).

``` csound-csd title="Example of the hilbert2 opcode." linenums="1"
--8<-- "examples/hilbert2.csd"
```

## See also

[Specialized Filters: Other filters](../../sigmod/speciali)

## Credits

Author: Victor Lazzarini<br>
2017<br>
