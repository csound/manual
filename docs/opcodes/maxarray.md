<!--
id:maxarray
category:Array Opcodes
-->
# maxarray
Returns the maximum value in a k-rate array, and optional its index.

## Syntax
=== "Modern"
    ``` csound-orc
    kmax [,kindx] = maxarray(karray)
    ```

=== "Classic"
    ``` csound-orc
    kmax [,kindx] maxarray karray
    ```

### Performance

_kmax_ --  variable for result.

_kindx_ --  position (index) of result in array.

_karray_ --  array for reading.

## Examples

Here is an example of the maxarray opcode. It uses the file [maxarray.csd](../examples/maxarray.csd).

``` csound-csd title="Example of the maxarray opcode." linenums="1"
--8<-- "examples/maxarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.14

Revised in Csound version 6.00 to work on multidimensional arrays
