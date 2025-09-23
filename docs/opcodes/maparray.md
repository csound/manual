<!--
id:maparray
category:Table Control:Table Queries
-->
# maparray
Apply a function of one argument to every element of a vector (one-dimensional k-rate array).

## Syntax
=== "Modern"
    ``` csound-orc
    karray = maparray(kinarray, String)
    karray = maparray_i(kinarray, String)
    ```

=== "Classic"
    ``` csound-orc
    karray maparray kinarray, String
    karray maparray_i kinarray, String
    ```

### Initialization

_String_ -- a string that names an opcode function, at i-rate for maparray_i or k-rate for maparray.

### Performance

_karray_ --  array for answers.

_kinarray_ --  array for arguments to the function.

## Examples

Here is an example of the maparray opcode. It uses the file [maparray.csd](../examples/maparray.csd).

``` csound-csd title="Example of the maparray opcode." linenums="1"
--8<-- "examples/maparray.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00
