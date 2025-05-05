<!--
id:zkmod
category:Zak Patch System
-->
# zkmod
Facilitates the modulation of one signal by another.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = zkmod(ksig, kzkmod)
    ```

=== "Classic"
    ``` csound-orc
    kres zkmod ksig, kzkmod
    ```

### Performance

_ksig_ -- the input signal

_kzkmod_ -- controls which zk variable is used for modulation. A positive value means additive modulation, a negative value means multiplicative modulation. A value of 0 means no change to _ksig_. _kzkmod_ can be i-rate or k-rate

_zkmod_ facilitates the modulation of one signal by another, where the modulating signal comes from a zk variable. Either additive or mulitiplicative modulation can be specified.

## Examples

Here is an example of the zkmod opcode. It uses the file [zkmod.csd](../examples/zkmod.csd).

``` csound-csd title="Example of the zkmod opcode." linenums="1"
--8<-- "examples/zkmod.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
