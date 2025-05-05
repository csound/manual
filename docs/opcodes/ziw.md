<!--
id:ziw
category:Zak Patch System
-->
# ziw
Writes to a zk variable at i-rate without mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    ziw(isig, indx)
    ```

=== "Classic"
    ``` csound-orc
    ziw isig, indx
    ```

### Initialization

_isig_ -- initializes the value of the zk location.

_indx_ -- points to the zk location to which to write.

### Performance

_ziw_ writes _isig_ into the zk variable specified by _indx_.

These opcodes are fast, and always check that the index is within the range of zk or za space. If not, an error is reported, 0 is returned, and no writing takes place.

## Examples

Here is an example of the ziw opcode. It uses the file [ziw.csd](../examples/ziw.csd).

``` csound-csd title="Example of the ziw opcode." linenums="1"
--8<-- "examples/ziw.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
