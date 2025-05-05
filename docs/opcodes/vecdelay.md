<!--
id:vecdelay
category:Vectorial:Delay Paths
-->
# vecdelay
Generate a sort of 'vectorial' delay.

## Syntax
=== "Modern"
    ``` csound-orc
    vecdelay(ifn, ifnIn, ifnDel, ielements, imaxdel [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    vecdelay ifn, ifnIn, ifnDel, ielements, imaxdel [, iskip]
    ```

### Initialization

_ifn_  - number of the table containing the output vector

_ifnIn_  - number of the table containing the input vector

_ifnDel_ - number of the table containing a vector whose elements contain delay values in seconds

_ielements_ - number of elements of the two vectors

_imaxdel_  - Maximum value of delay in seconds.

_iskip_ (optional) - initial disposition of delay-loop data space (see reson). The default value is 0.

### Performance

_vecdelay_ is similar to [vdelay](../opcodes/vdelay.md), but it works at k-rate and, instead of delaying a single signal, it delays a vector. _ifnIn_ is the input vector of signals, _ifn_ is the output vector of signals, and _ifnDel_ is a vector containing delay times for each element, expressed in seconds. Elements of _ifnDel_ can be updated at k-rate. Each single delay can be different from that of the other elements, and can vary at k-rate. imaxdel sets the maximum delay allowed for all elements of _ifnDel_.

## See also

[Vectorial Control-rate Delay Paths](../vectorial/delay.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
