<!--
id:zamod
category:Zak Patch System
-->
# zamod
Modulates one a-rate signal by a second one.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = zamod(asig, kzamod)
    ```

=== "Classic"
    ``` csound-orc
    ares zamod asig, kzamod
    ```

### Performance

_asig_ -- the input signal

_kzamod_ -- controls which za variable is used for modulation. A positive value means additive modulation, a negative value means multiplicative modulation. A value of 0 means no change to _asig_.

_zamod_ modulates one a-rate signal by a second one, which comes from a za variable. The location of the modulating variable is controlled by the i-rate or k-rate variable _kzamod_. This is the a-rate version of [zkmod](../opcodes/zkmod.md).

## Examples

Here is an example of the zamod opcode. It uses the file [zamod.csd](../examples/zamod.csd).

``` csound-csd title="Example of the zamod opcode." linenums="1"
--8<-- "examples/zamod.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
