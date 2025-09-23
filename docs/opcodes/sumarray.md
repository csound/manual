<!--
id:sumarray
category:Array Opcodes
-->
# sumarray
Returns the sum of all elements in a k-rate array.

## Syntax
=== "Modern"
    ``` csound-orc
    ksum = sumarray(karray)
    ```

=== "Classic"
    ``` csound-orc
    ksum sumarray karray
    ```

### Performance

_ksum_ --  variable for result.

_karray_ --  array for reading.

## Examples

Here is an example of the sumarray opcode. It uses the file [sumarray.csd](../examples/sumarray.csd).

``` csound-csd title="Example of the sumarray opcode." linenums="1"
--8<-- "examples/sumarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
October 2011<br>

New in Csound version 5.14

Revised in Csound version 6.00 to work on multidimensional arrays
