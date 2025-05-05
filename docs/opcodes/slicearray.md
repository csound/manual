<!--
id:slicearray
category:Table Control:Table Queries
-->
# slicearray
Take a slice of a vector (one-dimensional k-rate array).

## Syntax
=== "Modern"
    ``` csound-orc
    karray = slicearray(kinarray, istart, iend [,istride])
    ```

=== "Classic"
    ``` csound-orc
    karray slicearray kinarray, istart, iend [,istride]
    ```

### Initialization

_istart_ -- index of the first part of the answer.

_iend_ -- index of the last element of the answer.

_istride_ -- increment for source elements (optional), defaults to 1.

## Examples

Here is an example of the slicearray opcode. It uses the file [slicearray.csd](../examples/slicearray.csd).

``` csound-csd title="Example of the slicearray opcode." linenums="1"
--8<-- "examples/slicearray.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00

istride argument new in 6.10
