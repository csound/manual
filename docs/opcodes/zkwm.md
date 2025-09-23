<!--
id:zkwm
category:Zak Patch System
-->
# zkwm
Writes to a zk variable at k-rate with mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    zkwm(ksig, kndx [, imix])
    ```

=== "Classic"
    ``` csound-orc
    zkwm ksig, kndx [, imix]
    ```

### Initialization

_imix_ (optional, default=1) -- indicates if mixing should occur.

### Performance

_ksig_ -- value to be written to the zk location.

_kndx_ -- points to the zk location to which to write.

_zkwm_ is a mixing opcode, it adds the signal to the current value of the variable. If no _imix_ is specified, mixing always occurs. _imix_ = 0 will cause overwriting like _ziw_, _zkw_, and _zaw_. Any other value will cause mixing.

_Caution_: When using the mixing opcodes _ziwm_, _zkwm_, and _zawm_, care must be taken that the variables mixed to, are zeroed at the end (or start) of each k- or a-cycle. Continuing to add signals to them, can cause their values can drift to astronomical figures.

One approach would be to establish certain ranges of zk or za variables to be used for mixing, then use _zkcl_ or _zacl_ to clear those ranges.

## Examples

Here is an example of the zkwm opcode. It uses the file [zkwm.csd](../examples/zkwm.csd).

``` csound-csd title="Example of the zkwm opcode." linenums="1"
--8<-- "examples/zkwm.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
