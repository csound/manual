<!--
id:sorta
category:Array Operations: sorting
-->
# sorta
Takes a numeric array (k or i-rate) and returns it sorted in ascending order.

## Syntax
=== "Modern"
    ``` csound-orc
    k/i[] = sorta(k/i[])  (k- or i-arrays )
    ```

=== "Classic"
    ``` csound-orc
    k/i[] sorta k/i[]  (k- or i-arrays )
    ```

## Examples

Here is an example of the sorta opcode. It uses the file [sorta.csd](../examples/sorta.csd).

``` csound-csd title="Example of the sorta opcode." linenums="1"
--8<-- "examples/sorta.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini

New in version 6.09
