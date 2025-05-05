<!--
id:tablexseg
category:Spectral Processing:STFT
-->
# tablexseg
Creates a new function table by making exponential segments between values in stored function tables.

_tablexseg_ is like [expseg](../opcodes/expseg.md) but interpolate between values in a stored function tables. The result is a new function table passed internally to any following [vpvoc](../opcodes/vpvoc.md) which occurs before a subsequent _tablexseg_ (much like [lpread](../opcodes/lpread.md)/[lpreson](../opcodes/lpreson.md) pairs work). The uses of these are described below under _vpvoc_.

## Syntax
=== "Modern"
    ``` csound-orc
    tablexseg(ifn1, idur1, ifn2 [, idur2] [, ifn3] [...])
    ```

=== "Classic"
    ``` csound-orc
    tablexseg ifn1, idur1, ifn2 [, idur2] [, ifn3] [...]
    ```

### Initialization

_ifn1_, _ifn2_, _ifn3_, etc. -- function table numbers. _ifn1_, _ifn2_, and so on, must be the same size.

_idur1_, _idur2_, etc. -- durations during which interpolation from one table to the next will take place.

## Examples

Here is an example of the tablexseg opcode. It uses the file [tableseg_tablexseg.csd](../examples/tableseg_tablexseg.csd).

``` csound-csd title="Example of the tablexseg opcode." linenums="1"
--8<-- "examples/tableseg_tablexseg.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1997<br>
