<!--
id:ziwm
category:Zak Patch System
-->
# ziwm
Writes to a zk variable to an i-rate variable with mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    ziwm(isig, indx [, imix])
    ```

=== "Classic"
    ``` csound-orc
    ziwm isig, indx [, imix]
    ```

### Initialization

_isig_ -- initializes the value of the zk location.

_indx_ -- points to the zk location location to which to write.

_imix_ (optional, default=1) -- indicates if mixing should occur.

### Performance

_ziwm_ is a mixing opcode, it adds the signal to the current value of the variable. If no _imix_ is specified, mixing always occurs. _imix_ = 0 will cause overwriting like _ziw_, _zkw_, and _zaw_. Any other value will cause mixing.

_Caution_: When using the mixing opcodes _ziwm_, _zkwm_, and _zawm_, care must be taken that the variables mixed to, are zeroed at the end (or start) of each k- or a-cycle. Continuing to add signals to them, can cause their values can drift to astronomical figures.

One approach would be to establish certain ranges of zk or za variables to be used for mixing, then use _zkcl_ or _zacl_ to clear those ranges.

## Examples

Here is an example of the ziwm opcode. It uses the file [ziwm.csd](../examples/ziwm.csd).

``` csound-csd title="Example of the ziwm opcode." linenums="1"
--8<-- "examples/ziwm.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
