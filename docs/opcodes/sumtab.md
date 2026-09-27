<!--
id:sumtab
category:Array Opcodes
status:deprecated
-->
# sumtab
Returns the sum of a k-rate array.

This opcode is deprecated. Use [sumarray](sumarray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    ksum = sumtab(kArray[])
    ```

=== "Classic"
    ``` csound-orc
    ksum sumtab kArray[]
    ```

### Performance

`kArray[]` is an initialized numeric k-rate array. The opcode adds all its elements on each control cycle and returns the result in `ksum`. It includes all dimensions and leaves the array unchanged.

## Replacement

Change `ksum = sumtab(kArray)` to `ksum = sumarray(kArray)`. The two names use the same k-rate implementation.

`sumarray` also accepts i-rate arrays for initialization-time sums and audio arrays for sample-by-sample sums.

See [sumarray](sumarray.md) for examples and the supported forms.

## Credits

Author John ffitch.
