<!--
id:product
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# product
Multiplies any number of a-rate signals.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = product(asig1, asig2 [, asig3] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares product asig1, asig2 [, asig3] [...]
    ```

### Performance

_asig1, asig2, asig3, ..._ --  a-rate signals to be multiplied.

## Examples

Here is an example of the product opcode. It uses the file [product.csd](../examples/product.csd).

``` csound-csd title="Example of the product opcode." linenums="1"
--8<-- "examples/product.csd"
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
April 1999<br>

New in Csound version 3.54
