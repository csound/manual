<!--
id:chn
category:Signal I/O:Software Bus
-->
# chn
Declare a channel of the named software bus.

Optional parameters can be set in the case of a control channel. If the channel does not exist yet, it is created, with an inital value of zero or empty string. Otherwise, the type (control, audio, or string) of the existing channel must match the declaration, or an init error occurs. The input/output mode of an existing channel is updated so that it becomes the bitwise OR of the previous and the newly specified value.

## Syntax
=== "Modern"
    ``` csound-orc
    chn_k(Sname, imode[, itype, idflt, imin, ima, ix, iy, iwidth, iheight, Sattributes])
    chn_a(Sname, imode)
    chn_S(Sname, imode)
    chn_S(Sname, Smode)
    chn_array(Sname, imode, Stype, iSizes[])
    ```

=== "Classic"
    ``` csound-orc
    chn_k Sname, imode[, itype, idflt, imin, ima, ix, iy, iwidth, iheight, Sattributes]
    chn_a Sname, imode
    chn_S Sname, imode
    chn_S Sname, Smode
    chn_array Sname, imode, Stype, iSizes[]
    ```

### Initialization

_imode_ -- sum of at least one of 1 for input and 2 for output.

_Smode_ -- The mode can also be set with a string: "r" for input, "w" for output or "rw" for input/output

_Stypes_ -- the array channel type ("k", "a", "S").

_iSizes[]_ -- the sizes for each dimension of the array channel.

_itype_ (optional, defaults to 0) -- channel subtype for control channels only. Possible values are:

*   0: default/unspecified (_idflt_, _imin_, and _imax_ are ignored)
*   1: integer values only
*   2: linear scale
*   3: exponential scale

_idflt_ (optional, defaults to 0) -- default value, for control channels with non-zero _itype_ only. Must be greater than or equal to _imin_, and less than or equal to _imax_.

_imin_ (optional, defaults to 0) -- minimum value, for control channels with non-zero _itype_ only. Must be non-zero for exponential scale (_itype_ = 3).

_imax_ (optional, defaults to 0) -- maximum value, for control channels with non-zero _itype_ only. Must be greater than _imin_. In the case of exponential scale, it should also match the sign of _imin_.

_ix_ -- suggested x position for controller.

_iy_ -- suggested y position for controller.

_iwidth_ -- suggested width position for controller.

_iheight_ -- suggested height position for controller.

_Sattributes_ -- attributes for controller.

### Notes

The channel parameters (_imode_, _itype_, _idflt_, _imin_, and _imax_) are only hints for the host application or external software accessing the bus through the API, and do not actually restrict reading from or writing to the channel in any way. Also, the initial value of a newly created control channel is zero, regardless of the setting of _idflt_.

For communication with external software, using [chnexport](../opcodes/chnexport.md) may be preferred, as it allows direct access to orchestra variables exported as channels of the bus, eliminating the need for using [chnset](../opcodes/chnset.md) and [chnget](../opcodes/chnget.md) to send or receive data.

### Performance

_chn_k_, _chn_a_, and _chn_S_ declare a control, audio, or string channel, respectively.

### Examples

The example shows the software bus being used as an asynchronous control signal to select a filter cutoff.  It assumes that an external program that has access to the API is feeding the values.

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

chn_k "cutoff", 1, 3, 1000, 500, 2000

instr   1
    kc   chnget    "cutoff"
    a1   oscil     p4, p5, 100
    a2   lowpass2  a1, kc, 200
         out       a2
endin
```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: Istvan Varga<br>
2005<br>
