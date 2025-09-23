<!--
id:zawm
category:Zak Patch System
-->
# zawm
Writes to a za variable at a-rate with mixing.

## Syntax
=== "Modern"
    ``` csound-orc
    zawm(asig, kndx [, imix])
    ```

=== "Classic"
    ``` csound-orc
    zawm asig, kndx [, imix]
    ```

### Initialization

_imix_ (optional, default=1) -- indicates if mixing should occur.

### Performance

_asig_ -- value to be written to the za location.

_kndx_ -- points to the za location to which to write.

These opcodes are fast, and always check that the index is within the range of zk or za space. If not, an error is reported, 0 is returned, and no writing takes place.

_zawm_ is a mixing opcode, it adds the signal to the current value of the variable. If no _imix_ is specified, mixing always occurs. _imix_ = 0 will cause overwriting like _ziw_, _zkw_, and _zaw_. Any other value will cause mixing.

_Caution_: When using the mixing opcodes _ziwm_, _zkwm_, and _zawm_, care must be taken that the variables mixed to, are zeroed at the end (or start) of each k- or a-cycle. Continuing to add signals to them, can cause their values can drift to astronomical figures.

One approach would be to establish certain ranges of zk or za variables to be used for mixing, then use _zkcl_ or _zacl_ to clear those ranges.

## Examples

Here is an example of the zawm opcode. It uses the file [zawm.csd](../examples/zawm.csd).

``` csound-csd title="Example of the zawm opcode." linenums="1"
--8<-- "examples/zawm.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
