<!--
id:chnparams
category:Signal I/O:Software Bus
-->
# chnparams
Query parameters of a channel (if it does not exist, all returned values are zero).

## Syntax
=== "Modern"
    ``` csound-orc
    itype, imode, ictltype, idflt, imin, imax = chnparams(Sname)
    ```

=== "Classic"
    ``` csound-orc
    itype, imode, ictltype, idflt, imin, imax chnparams Sname
    ```

### Initialization

_itype_ -- channel data type (1: control, 2: audio, 3: string)

_imode_ -- sum of 1 for input and 2 for output

_ictltype_ -- special parameter for control channel only; if not available, set to zero.

_idflt_ -- special parameter for control channel only; if not available, set to zero.

_imin_ -- special parameter for control channel only; if not available, set to zero.

_imax_ -- special parameter for control channel only; if not available, set to zero.

_Sname_ -- string identifying the channel.

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: Istvan Varga<br>
2005<br>
