<!--
id:productarray
category:Array Opcodes
-->
# product
Calculates the product of an array.

Takes a numeric array (k or i-rate) and calculates its product.

## Syntax
=== "Modern"
    ``` csound-orc
    kres/ires = product(karr[]/iarr[])  (k- or i-arrays )
    ```

=== "Classic"
    ``` csound-orc
    kres/ires product karr[]/iarr[]  (k- or i-arrays )
    ```

## Examples

Here is an example of the product opcode. It uses the file [productarray.csd](../examples/productarray.csd).

``` csound-csd title="Example of the product opcode." linenums="1"
--8<-- "examples/productarray.csd"
```

## See also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini

New in version 6.09
