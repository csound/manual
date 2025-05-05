<!--
id:zakinit
category:Zak Patch System
-->
# zakinit
Establishes zak space. Must be called only once.

## Syntax
=== "Modern"
    ``` csound-orc
    zakinit(isizea, isizek)
    ```

=== "Classic"
    ``` csound-orc
    zakinit isizea, isizek
    ```

### Initialization

_isizea_ -- the number of audio rate locations for a-rate patching. Each location is actually an array which is ksmps long.

_isizek_ -- the number of locations to reserve for floats in the zk space. These can be written and read at i- and k-rates.

### Performance

At least one location each is always allocated for both za and zk spaces. There can be thousands or tens of thousands za and zk ranges, but most pieces probably only need a few dozen for patching signals. These patching locations are referred to by number in the other zak opcodes.

To run _zakinit_ only once, put it outside any instrument definition, in the orchestra file header, after _sr_, _kr_, _ksmps_, and _nchnls_.

> :memo: **Note**
>
> Zak channels count from 0, so if you define 1 channel, the only valid channel is channel 0.

## Examples

Here is an example of the zakinit opcode. It uses the file [zakinit.csd](../examples/zakinit.csd).

``` csound-csd title="Example of the zakinit opcode." linenums="1"
--8<-- "examples/zakinit.csd"
```

## See also

[Zak Patch System](../zak/top.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.45

Example written by Kevin Conder.
