<!--
id:chnexport
category:Signal I/O:Software Bus
-->
# chnexport
Export a global variable as a channel of the bus.

The channel should not already exist, otherwise an init error occurs. This opcode is normally called from the orchestra header, and allows the host application to read or write orchestra variables directly, without having to use [chnget](../opcodes/chnget.md) or [chnset](../opcodes/chnset.md) to copy data.

## Syntax
=== "Modern"
    ``` csound-orc
    gival = chnexport(Sname, imode[, itype, idflt, imin, imax])
    gkval = chnexport(Sname, imode[, itype, idflt, imin, imax])
    gaval = chnexport(Sname, imode)
    gSval = chnexport(Sname, imode)
    ```

=== "Classic"
    ``` csound-orc
    gival chnexport Sname, imode[, itype, idflt, imin, imax]
    gkval chnexport Sname, imode[, itype, idflt, imin, imax]
    gaval chnexport Sname, imode
    gSval chnexport Sname, imode
    ```

### Initialization

_imode_ -- sum of at least one of 1 for input and 2 for output.

_itype_ (optional, defaults to 0) -- channel subtype for control channels only. Possible values are:

*   0: default/unspecified (_idflt_, _imin_, and _imax_ are ignored)
*   1: integer values only
*   2: linear scale
*   3: exponential scale

_idflt_ (optional, defaults to 0) -- default value, for control channels with non-zero _itype_ only. Must be greater than or equal to _imin_, and less than or equal to _imax_.

_imin_ (optional, defaults to 0) -- minimum value, for control channels with non-zero _itype_ only. Must be non-zero for exponential scale (_itype_ = 3).

_imax_ (optional, defaults to 0) -- maximum value, for control channels with non-zero _itype_ only. Must be greater than _imin_. In the case of exponential scale, it should also match the sign of _imin_.

### Notes

The channel parameters (_imode_, _itype_, _idflt_, _imin_, and _imax_) are only hints for the host application or external software accessing the bus through the API, and do not actually restrict reading from or writing to the channel in any way.

While the global variable is used as output argument, _chnexport_ does not actually change it, and always runs at i-time only. If the variable is not previously declared, it is created by Csound with an initial value of zero or empty string.

## Examples

The example shows the software bus being used as an asynchronous control signal to select a filter cutoff.  It assumes that an external program that has access to the API is feeding the values.

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

gkc init 1000   ; set default value
gkc chnexport "cutoff", 1, 3, i(gkc), 500, 2000

instr   1
    a1   oscil     p4, p5, 100
    a2   lowpass2  a1, gkc, 200
         out       a2
endin
```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: Istvan Varga<br>
2005<br>
