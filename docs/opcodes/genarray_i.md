<!--
id:genarray_i
category:Table Control:Table Queries
-->
# genarrayi
Generate a vector (one-dimensional k-rate) with an arithmetic sequence at initialisation time.

## Syntax
=== "Modern"
    ``` csound-orc
    karray = genarrayi(istart, iend [,inc])
    ```

=== "Classic"
    ``` csound-orc
    karray genarray_i istart, iend [,inc]
    ```

### Initialization

_istart_ -- value to place in first element.

_iend_ -- last value to place in array.

_inc_ -- amount to add to previous value (default 1).

## Examples

=== "Modern"
    Here is an example of the genarrayi opcode. It uses the file [genarrayi.csd](../examples/genarrayi.csd).
    ``` csound-csd title="Example of the genarrayi opcode." linenums="1"
    --8<-- "examples/genarrayi.csd"
    ```

=== "Classic"
    Here is an example of the genarray_i opcode. It uses the file [genarray_i.csd](../examples/genarray_i.csd).
    ``` csound-csd title="Example of the genarray_i opcode." linenums="1"
    --8<-- "examples/genarray_i.csd"
    ```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00
