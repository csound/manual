<!--
id:sortd
category:Array Operations: sorting
-->
# sortd
Takes a numeric array (k or i-rate) and returns it sorted in descending order.

## Syntax
=== "Modern"
    ``` csound-orc
    k/i[] = sortd(k/i[])  (k- or i-arrays )
    ```

=== "Classic"
    ``` csound-orc
    k/i[] sortd k/i[]  (k- or i-arrays )
    ```

## Examples

Here is an example of the sortd opcode. It uses the file [sortd.csd](../examples/sortd.csd).

``` csound-csd title="Example of the sortd opcode." linenums="1"
--8<-- "examples/sortd.csd"
```

## See Also

[Array opcodes](../math/array.md)

## Credits

Author: Victor Lazzarini

New in version 6.09
