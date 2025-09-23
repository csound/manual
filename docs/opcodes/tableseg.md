<!--
id:tableseg
category:Spectral Processing:STFT
-->
# tableseg
Creates a new function table by making linear segments between values in stored function tables.

_tableseg_ is like [linseg](../opcodes/linseg.md) but interpolate between values in a stored function tables. The result is a new function table passed internally to any following [vpvoc](../opcodes/vpvoc.md) which occurs before a subsequent _tableseg_ (much like [lpread](../opcodes/lpread.md)/[lpreson](../opcodes/lpreson.md) pairs work). The uses of these are described below under _vpvoc_.

## Syntax
=== "Modern"
    ``` csound-orc
    tableseg(ifn1, idur1, ifn2 [, idur2] [, ifn3] [...])
    ```

=== "Classic"
    ``` csound-orc
    tableseg ifn1, idur1, ifn2 [, idur2] [, ifn3] [...]
    ```

### Initialization

_ifn1_, _ifn2_, _ifn3_, etc. -- function table numbers. _ifn1_, _ifn2_, and so on, must be the same size.

_idur1_, _idur2_, etc. -- durations during which interpolation from one table to the next will take place.

## Examples

Here is an example of the tableseg opcode. It uses the file [tableseg_tablexseg.csd](../examples/tableseg_tablexseg.csd).

``` csound-csd title="Example of the tableseg opcode." linenums="1"
--8<-- "examples/tableseg_tablexseg.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, Wash<br>
1997<br>

New in version 3.44
