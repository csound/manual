<!--
id:lpinterp
category:Spectral Processing:LPC
-->
# lpinterp
Computes a new set of poles from the interpolation between two analysis.

## Syntax
=== "Modern"
    ``` csound-orc
    lpinterp(islot1, islot2, kmix)
    ```

=== "Classic"
    ``` csound-orc
    lpinterp islot1, islot2, kmix
    ```

### Initialization

_islot1_ -- slot where the first analysis was stored

_islot2_ -- slot where the second analysis was stored

_kmix_ -- mix value between the two analysis. Should be between 0 and 1. 0 means analysis 1 only. 1 means analysis 2 only. Any value in between will produce interpolation between the filters.

_lpinterp_ computes a new set of poles from the interpolation between two analysis. The poles will be stored in the current _lpslot_ and used by the next _lpreson_ opcode.

## Examples

See the example for [lpslot](../opcodes/lpslot.md).

## See also

[Linear Predictive Coding (LPC) Resynthesis](../spectral/lpcresyn.md)

## Credits

Author: Gabriel Maldonado
