<!--
id:mfb
category:Array Operations: Mel scale filterbank
-->
# mfb
Mel scale filterbank for spectral magnitudes.

Applies a Mel scale filterbank to an array containing a series of magnitude bins.

## Syntax
=== "Modern"
    ``` csound-orc
    kout[] = mfb(kin[], klow, khigh, ibands)
    ```

=== "Classic"
    ``` csound-orc
    kout[] mfb kin[], klow, khigh, ibands
    ```

### Initialization

_ibands_ -- number of bands in the Mel filter bank. Determines the size of the output array.

### Performance

_kout[]_ -- output array containing the MFB with ibands bands. It will be created if it does not exist.

_kin[]_ -- input array containing the input magnitude bins.

_klow_ -- lowest frequency (rounded to the nearest bin centre frequency).

_khigh_ -- highest lowest frequency (rounded to the nearest bin centre frequency).

## Examples

Here is an example of the mfb opcode. It uses the file [mfb.csd](../examples/mfb.csd).

``` csound-csd title="Example of the mfb opcode." linenums="1"
--8<-- "examples/mfb.csd"
```

## See Also

[Vectorial opcodes](../vectorial/top.md),
[array opcodes](../math/array.md),
[dct](../opcodes/dct.md)

## Credits

Author: Victor Lazzarini<br>
NUI Maynooth<br>
2016<br>

New in version 6.08
