<!--
id:zaw
category:Zak Patch System
-->
# zaw
Writes to a za variable at a-rate without mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    zaw(asig, kndx)
    ```

=== "Classic"
    ``` csound-orc
    zaw asig, kndx
    ```

### Performance

_asig_ -- value to be written to the za location.

_kndx_ -- points to the za location to which to write.

_zaw_ writes _asig_ into the za variable specified by _kndx_.

These opcodes are fast, and always check that the index is within the range of zk or za space. If not, an error is reported, 0 is returned, and no writing takes place.

## Examples

Here is an example of the zaw opcode. It uses the file [zaw.csd](../examples/zaw.csd).

``` csound-csd title="Example of the zaw opcode." linenums="1"
--8<-- "examples/zaw.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
