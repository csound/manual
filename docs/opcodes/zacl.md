<!--
id:zacl
category:Zak Patch System
-->
# zacl
Clears one or more variables in the za space.

## Syntax
=== "Modern"
    ``` csound-orc
    zacl(kfirst [, klast])
    ```

=== "Classic"
    ``` csound-orc
    zacl kfirst [, klast]
    ```

### Performance

_kfirst_ -- first za location in the range to clear.

_klast_ -- last za location in the range to clear. If not given, only _kfirst_ location is cleared

_zacl_ clears one or more variables in the za space. This is useful for those variables which are used as accumulators for mixing a-rate signals at each cycle, but which must be cleared before the next set of calculations.

## Examples

Here is an example of the zacl opcode. It uses the file [zacl.csd](../examples/zacl.csd).

``` csound-csd title="Example of the zacl opcode." linenums="1"
--8<-- "examples/zacl.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
