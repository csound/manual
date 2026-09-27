<!--
id:minarray
category:Array Opcodes
-->
# minarray
Returns the minimum value in a numeric array and optionally its index.

## Syntax
=== "Modern"
    ``` csound-orc
    kmin [,kindx] = minarray(karray)
    imin [,iindx] = minarray(iarray)
    ```

=== "Classic"
    ``` csound-orc
    kmin [,kindx] minarray karray
    imin [,iindx] minarray iarray
    ```

### Performance

_kmin_ --  variable for result.

_kindx_ --  position (index) of result in array.

_karray_ --  array for reading.

The array must be initialized and nonempty. The i-rate form runs once at initialization. The k-rate form reads the array on each control cycle.

The optional index is zero-based and selects the first occurrence when values tie. For a multidimensional array, it counts through all elements in storage order, with the last dimension changing fastest.

## Replacing mintab

[mintab](mintab.md) is the deprecated k-rate name. Replace `kValue, kIndex = mintab(kArray)` with `kValue, kIndex = minarray(kArray)`. Keep the same array and outputs. Both names use the same k-rate implementation. Only `minarray` offers the i-rate form.

## Examples

Here is an example of the minarray opcode. It uses the file [minarray.csd](../examples/minarray.csd).

``` csound-csd title="Example of the minarray opcode." linenums="1"
--8<-- "examples/minarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.14

Revised in Csound version 6.00 to work on multidimensional arrays
