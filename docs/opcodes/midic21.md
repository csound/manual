<!--
id:midic21
category:Real-time MIDI:Input
-->
# midic21
Allows a floating-point 21-bit MIDI signal scaled with a minimum and a maximum range.

## Syntax
=== "Modern"
    ``` csound-orc
    idest = midic21(ictlno1, ictlno2, ictlno3, imin, imax [, ifn])
    kdest = midic21(ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    idest midic21 ictlno1, ictlno2, ictlno3, imin, imax [, ifn]
    kdest midic21 ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn]
    ```

### Initialization

_idest_ -- output signal

_ictln1o_ -- most-significant byte controller number (0-127)

_ictlno2_ -- mid-significant byte controller number (0-127)

_ictlno3_ -- least-significant byte controller number (0-127)

_imin_ -- user-defined minimum floating-point value of output

_imax_ -- user-defined maximum floating-point value of output

_ifn_ (optional) -- table to be read when indexing is required. Table must be normalized. Output is scaled according to the _imin_ and _imax_ values.

### Performance

_kdest_ -- output signal

_kmin_ -- user-defined minimum floating-point value of output

_kmax_ -- user-defined maximum floating-point value of output

_midic21_ (i- and k-rate 21 bit MIDI control) allows a floating-point 21-bit MIDI signal scaled with a minimum and a maximum range. Minimum and maximum values can be varied at k-rate. It can use optional interpolated table indexing. It requires three MIDI controllers as input.

> :memo: **Note**
>
> Please note that the _midic_ family of opcodes are designed for MIDI triggered events, and do not require a channel number since they will respond to the same channel as the one that triggered the instrument (see [massign](../opcodes/massign.md)). However they will crash if called from a score driven event.

## Examples

Here is an example of the midic21 opcode. It uses the file [midic21.csd](../examples/midic21.csd).

``` csound-csd title="Example of the midic21 opcode." linenums="1"
--8<-- "examples/midic21.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct controller number range.
