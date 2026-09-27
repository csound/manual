<!--
id:sumarray
category:Array Opcodes
-->
# sumarray
Returns the sum of all elements in a numeric array.

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

## Replacing sumtab

[sumtab](sumtab.md) is the deprecated k-rate name. Replace `ksum = sumtab(kArray)` with `ksum = sumarray(kArray)`. Both add all elements, across all dimensions, on each control cycle.

`sumarray` also accepts i-rate arrays at initialization and audio arrays for sample-by-sample summation. `sumtab` accepts only k-rate arrays.

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
