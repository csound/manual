<!--
id:midic7
category:Real-time MIDI:Input
-->
# midic7
Allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range.

## Syntax
=== "Modern"
    ``` csound-orc
    idest = midic7(ictlno, imin, imax [, ifn])
    kdest = midic7(ictlno, kmin, kmax [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    idest midic7 ictlno, imin, imax [, ifn]
    kdest midic7 ictlno, kmin, kmax [, ifn]
    ```

### Initialization

_idest_ -- output signal

_ictlno_ -- MIDI controller number (0-127)

_imin_ -- user-defined minimum floating-point value of output

_imax_ -- user-defined maximum floating-point value of output

_ifn_ (optional) -- table to be read when indexing is required. Table must be normalized. Output is scaled according to the _imin_ and _imax_ values.

### Performance

_kdest_ -- output signal

_kmin_ -- user-defined minimum floating-point value of output

_kmax_ -- user-defined maximum floating-point value of output

_midic7_ (i- and k-rate 7 bit MIDI control) allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range. It also allows optional non-interpolated table indexing. In _midic7_ minimum and maximum values can be varied at k-rate.

> :memo: **Note**
>
> Please note that the _midic_ family of opcodes are designed for MIDI triggered events, and do not require a channel number since they will respond to the same channel as the one that triggered the instrument (see [massign](../opcodes/massign.md)). However they will crash if called from a score driven event.

## Examples

Here is an example of the midic7 opcode. It uses the file [midic7.csd](../examples/midic7.csd)

``` csound-csd title="Example of the midic7 opcode." linenums="1"
--8<-- "examples/midic7.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct controller number range.
