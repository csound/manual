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

Initialisation

_karray_ -- The array that is being questioned.  It can be of any dimension.

_iwhich_ -- selects which dimension to evaluate the size.  If zero or negative it selects the number of dimensions.  It defaults to 1, as used in a vector.

### Performance

_kr_ -- length of vector.

_karray_ -- array to query.

If the dimension requested is larger than the actual array, or the array is not initialised the value -1 is returned.

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
