<!--
id:mintab
category:Array Opcodes
status:deprecated
-->
# mintab
Returns the minimum value in a k-rate array and optionally its index.

This opcode is deprecated. Use [minarray](minarray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    kmin [, kindex] = mintab(kArray[])
    ```

=== "Classic"
    ``` csound-orc
    kmin [, kindex] mintab kArray[]
    ```

### Performance

`kArray[]` must be an initialized, nonempty numeric k-rate array. The opcode checks every element on each control cycle and returns the minimum in `kmin`.

The optional `kindex` is zero-based. If several elements have the same minimum, it reports the first. For a multidimensional array, the index counts through all elements in storage order, with the last dimension changing fastest.

## Replacement

Change the name and keep the arguments and outputs. The k-rate forms share the same implementation.

``` csound-orc
// Old name
kValue, kIndex = mintab(kArray)
// Supported name
kValue, kIndex = minarray(kArray)
```

`minarray` also accepts an i-rate array and returns an i-rate value and optional index at initialization. The old name has only the k-rate form.

See [minarray](minarray.md) for examples.

## Credits

Author John ffitch, October 2011.
