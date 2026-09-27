<!--
id:lenarray
category:Table Control:Table Queries
-->
# lenarray
Evaluates the size or number of dimensions of an array.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = lenarray(karray[, iwhich])
    kr = lenarray(karray[, iwhich])
    ```

=== "Classic"
    ``` csound-orc
    ir lenarray karray[, iwhich]
    kr lenarray karray[, iwhich]
    ```

### Initialization

`karray` is the array to query. It may have any number of dimensions. Despite the argument name, `lenarray` accepts arrays of any element type.

_iwhich_ -- selects which dimension to evaluate the size.  If zero or negative it selects the number of dimensions.  It defaults to 1, as used in a vector.

### Performance

_kr_ -- length of vector.

_karray_ -- array to query.

If the dimension requested is larger than the actual array, or the array is not initialised the value -1 is returned.

## Replacing lentab

[lentab](lentab.md) is the deprecated name for queries on k-rate arrays. Change `kLength = lentab(kArray, 1)` to `kLength = lenarray(kArray, 1)`. The same change works with an i-rate result.

Keep the dimension argument. It starts at 1 and defaults to the first dimension. The default does not return the total number of elements in a multidimensional array.

The k-rate `lenarray` form also runs at initialization. The old k-rate `lentab` form runs only during performance. Initialize the array before querying its shape.

## Examples

Here is an example of the lenarray opcode. It uses the file [lenarray.csd](../examples/lenarray.csd).

``` csound-csd title="Example of the lenarray opcode." linenums="1"
--8<-- "examples/lenarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00

Extended to multi-dimensions in 6.04
