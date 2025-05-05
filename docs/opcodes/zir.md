<!--
id:zir
category:Zak Patch System
-->
# zir
Reads from a location in zk space at i-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = zir(indx)
    ```

=== "Classic"
    ``` csound-orc
    ir zir indx
    ```

### Initialization

_indx_ -- points to the zk location to be read.

### Performance

_zir_ reads the signal at _indx_ location in zk space.

## Examples

Here is an example of the zir opcode. It uses the file [zir.csd](../examples/zir.csd).

``` csound-csd title="Example of the zir opcode." linenums="1"
--8<-- "examples/zir.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
