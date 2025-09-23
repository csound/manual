<!--
id:ctrl14
category:Real-time MIDI:Input
-->
# ctrl14
Allows a floating-point 14-bit MIDI signal scaled with a minimum and a maximum range.

## Syntax
=== "Modern"
    ``` csound-orc
    idest = ctrl14(ichan, ictlno1, ictlno2, imin, imax [, ifn])
    kdest = ctrl14(ichan, ictlno1, ictlno2, kmin, kmax [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    idest ctrl14 ichan, ictlno1, ictlno2, imin, imax [, ifn]
    kdest ctrl14 ichan, ictlno1, ictlno2, kmin, kmax [, ifn]
    ```

### Initialization

_idest_ -- output signal

_ichan_ -- MIDI channel number (1-16)

_ictln1o_ -- most-significant byte controller number (0-127)

_ictlno2_ -- least-significant byte controller number (0-127)

_imin_ -- user-defined minimum floating-point value of output

_imax_ -- user-defined maximum floating-point value of output

_ifn_ (optional) -- table to be read when indexing is required. Table must be normalized. Output is scaled according to _imax_ and _imin_ val.

### Performance

_kdest_ -- output signal

_kmin_ -- user-defined minimum floating-point value of output

_kmax_ -- user-defined maximum floating-point value of output

_ctrl14_ (i- and k-rate 14 bit MIDI control) allows a floating-point 14-bit MIDI signal scaled with a minimum and a maximum range. The minimum and maximum values can be varied at k-rate. It can use optional interpolated table indexing. It requires two MIDI controllers as input.

_ctrl14_ differs from [midic14](../opcodes/midic14.md) because it can be included in score-oriented instruments without Csound crashes. It needs the additional parameter _ichan_ containing the MIDI channel of the controller. MIDI channel is the same for all the controllers used in a single _ctrl14_ opcode.

## Examples

Here is an example of the ctrl14 opcode. It uses the file [ctrl14.csd](../examples/ctrl14.csd).

``` csound-csd title="Example of the ctrl14 opcode." linenums="1"
--8<-- "examples/ctrl14.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
