<!--
id:genarray
category:Array Opcodes
-->
# genarray
Generate a vector (one-dimensional k-rate or i-rate array) with an arithmetic sequence.

## Syntax
=== "Modern"
    ``` csound-orc
    karray = genarray(kstart, kens [, inc])
    iarray = genarray(istart, iens [, inc])
    ```

=== "Classic"
    ``` csound-orc
    karray genarray kstart, kens [, inc]
    iarray genarray istart, iens [, inc]
    ```

The following expression can also be used,

```
array:{i,k} = [start ... ends, inc]
```

where `start`, `ends`,  and `inc` are as above for `genarray`. 


### Initialization

_istart_ -- value to place in first element.

_iend_ -- last value to place in array.

_inc_ -- amount to add to previous value (default 1).

## Examples

Here is an example of the genarray opcode. It uses the file [genarray.csd](../examples/genarray.csd).

``` csound-csd title="Example of the genarray opcode." linenums="1"
--8<-- "examples/genarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2013<br>

New in version 6.00
