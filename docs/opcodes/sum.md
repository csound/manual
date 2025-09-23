<!--
id:sum
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# sum
Sums any number of a-rate signals, or array elements.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = sum(asig1 [, asig2] [, asig3] [...])
    kres = sum(karr)
    ires = sum(iarr)
    ```

=== "Classic"
    ``` csound-orc
    ares sum asig1 [, asig2] [, asig3] [...]
    kres sum karr
    ires sum iarr
    ```

### Performance

_asig1, asig2, ..._ --  a-rate signals to be summed (mixed or added).

_karr, iarr_ -- Csound 1-dimensional arrays

## Examples

Here is an example of the sum opcode. It uses the file [sum.csd](../examples/sum.csd).

``` csound-csd title="Example of the sum opcode." linenums="1"
--8<-- "examples/sum.csd"
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
April 1999<br>

New in Csound version 3.54

Array versions new in version 6.09
