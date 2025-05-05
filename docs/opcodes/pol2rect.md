<!--
id:pol2rect
category:Array Operations: complex numbers
-->
# pol2rect
Converts an input array in magnitude-phase format to real-imaginary format.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = pol2rect(kin[])
    kout[] = pol2rect(kmags[], kphs[])
    ```

=== "Classic"
    ``` csound-orc
    kout[] pol2rect kin[]
    kout[] pol2rect kmags[], kphs[]
    ```

### Performance

_kout[]_ -- output array containing the complex-valued real-imaginary output. It will be created if it does not exist.

_kin[]_ -- input array containing the complex-valued magnitude-phase input.

_kmags[]_ -- input array containing the real-valued magnitude input. This is expected to contain only the non-negative spectrum (0 to Nyquist, inclusive).

_kphs[]_ -- input array containing the real-valued phase input. This is expected to contain only the non-negative spectrum (0 to Nyquist, inclusive).

NB: the second version of the opcode with two inputs is designed to produce a "packed" real FFT spectrum where the two positions in the array contain the real parts of zero Hz and Nyquist frequency. Therefore the output array length will be 2*L - 2, where L is the length of the input arrays (which should match).

## Examples

Here is an example of the pol2rect opcode. It uses the file [pol2rect.csd](../examples/pol2rect.csd).

``` csound-csd title="Example of the pol2rect opcode." linenums="1"
--8<-- "examples/pol2rect.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md),
[array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2014<br>

New in version 6.04
