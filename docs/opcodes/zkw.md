<!--
id:zkw
category:Zak Patch System
-->
# zkw
Writes to a zk variable at k-rate without mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    zkw(kval, kndx)
    ```

=== "Classic"
    ``` csound-orc
    zkw kval, kndx
    ```

### Performance

_kval_ -- value to be written to the zk location.

_kndx_ -- points to the zk location to which to write.

_zkw_ writes _kval_ into the zk variable specified by _kndx_.

## Examples

Here is an example of the zkw opcode. It uses the file [zkw.csd](../examples/zkw.csd).

``` csound-csd title="Example of the zkw opcode." linenums="1"
--8<-- "examples/zkw.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
