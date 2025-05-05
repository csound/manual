<!--
id:minarray
category:Array Opcodes
-->
# minarray
Returns the minimum value in a k-rate array, and optional its index.

## Syntax
=== "Modern"
    ``` csound-orc
    kmin [,kindx] = minarray(karray)
    ```

=== "Classic"
    ``` csound-orc
    kmin [,kindx] minarray karray
    ```

### Performance

_kmin_ --  variable for result.

_kindx_ --  position (index) of result in array.

_karray_ --  array for reading.

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
