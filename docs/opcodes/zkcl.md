<!--
id:zkcl
category:Zak Patch System
-->
# zkcl
Clears one or more variables in the zk space.

## Syntax
=== "Modern"
    ``` csound-orc
    zkcl(kfirst, klast)
    ```

=== "Classic"
    ``` csound-orc
    zkcl kfirst, klast
    ```

### Performance

_kfirst_ -- first zk location in the range to clear.

_klast_ -- last zk location in the range to clear.

_zkcl_ clears one or more variables in the zk space. This is useful for those variables which are used as accumulators for mixing k-rate signals at each cycle, but which must be cleared before the next set of calculations.

## Examples

Here is an example of the zkcl opcode. It uses the file [zkcl.csd](../examples/zkcl.csd).

``` csound-csd title="Example of the zkcl opcode." linenums="1"
--8<-- "examples/zkcl.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
