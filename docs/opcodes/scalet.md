<!--
id:scalet
category:Array Opcodes
status:deprecated
-->
# scalet
Rescales part of a k-rate array in place.

This opcode is deprecated. Use [scalearray](scalearray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    scalet(kArray[], kmin, kmax [, kleft, kright])
    ```

=== "Classic"
    ``` csound-orc
    scalet kArray[], kmin, kmax [, kleft, kright]
    ```

### Performance

`kArray[]` must be an initialized one-dimensional numeric array. The opcode rescales the selected elements to run from `kmin` to `kmax` on each control cycle. It changes the array directly and has no output argument.

`kleft` is the first index to include. `kright` is the first index to exclude. Their defaults select the whole array. Elements outside the selected range stay unchanged. If the selected values are all equal, the opcode sets them to `kmin`.

## Replacement

Change `scalet(kArray, kmin, kmax, kleft, kright)` to `scalearray(kArray, kmin, kmax, kleft, kright)`. Keep the same arguments and k-rate array. Both names use the same k-rate implementation.

`scalearray` also has an i-rate array form that runs at initialization.

See [scalearray](scalearray.md) for examples and the supported forms.

## Credits

Author John ffitch.
