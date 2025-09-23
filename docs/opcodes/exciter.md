<!--
id:exciter
category:Signal Modifiers:Specialized Filters
-->
# exciter
A non-linear filter system to excite the signal.

Plugin opcode in exciter. "Filtered distortion to add brilliance to a signal"

## Syntax
=== "Modern"
    ``` csound-orc
    ares = exciter(asig, kfreq, kceil, kharmonics, kblend)
    ```

=== "Classic"
    ``` csound-orc
    ares exciter asig, kfreq, kceil, kharmonics, kblend
    ```

### Initialization

### Performance

_asig_ -- input signal

_kfreq_ -- the lower end of the harmonics created.

_kceil_ -- the upper end of the harmonics created.

_kharmonics_ -- amount of harmonics in the range 0.1 - 10.

_kblend_ -- blend between 2nd and 3rd order harmonics in the range -10 - +10.

_exciter_ is a reimplementation of the calf exciter plugin.

## Examples

Here is an example of the exciter opcode. It uses the file [exciter.csd](../examples/exciter.csd).

``` csound-csd title="Example of the exciter opcode." linenums="1"
--8<-- "examples/exciter.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author: John ffitch after Markus Schmidt<br>
August 2014<br>

New in Csound version 6.04
