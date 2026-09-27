<!--
id:lentab
category:Table Control:Table Queries
status:deprecated
-->
# lentab
Returns a dimension's length or the number of dimensions in a k-rate array.

This opcode is deprecated. Use [lenarray](lenarray.md) in new code. The old name remains available for compatibility.

## Syntax

=== "Modern"
    ``` csound-orc
    ilength = lentab(kArray[] [, iwhich])
    klength = lentab(kArray[] [, iwhich])
    ```

=== "Classic"
    ``` csound-orc
    ilength lentab kArray[] [, iwhich]
    klength lentab kArray[] [, iwhich]
    ```

### Arguments

`kArray[]` is the array to query. The old name accepts k-rate arrays, even when the result is i-rate.

`iwhich` selects a dimension, starting at 1. It defaults to 1. Use 0 or a negative value to return the number of dimensions. A dimension number greater than the array's dimension count returns -1.

The i-rate form runs at initialization. The k-rate form runs each control cycle. For a multidimensional array, the default returns the first dimension's length, not the total number of elements.

## Replacement

Keep the result rate and dimension argument when changing the name.

``` csound-orc
// Old name
kLength = lentab(kArray, 1)
// Supported name
kLength = lenarray(kArray, 1)
```

`lenarray` accepts arrays of any element type. Its k-rate form runs at initialization as well as during performance, while the old k-rate form runs only during performance. Initialize the array before querying its shape.

See [lenarray](lenarray.md) for examples.

## Credits

Author John ffitch.
