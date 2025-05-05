<!--
id:ctrl7
category:Real-time MIDI:Input
-->
# ctrl7
Allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range.

## Syntax
=== "Modern"
    ``` csound-orc
    idest = ctrl7(ichan, ictlno, imin, imax [, ifn])
    kdest = ctrl7(ichan, ictlno, kmin, kmax [, ifn])
    adest = ctrl7(ichan, ictlno, kmin, kmax [, ifn] [, icutoff])
    ```

=== "Classic"
    ``` csound-orc
    idest ctrl7 ichan, ictlno, imin, imax [, ifn]
    kdest ctrl7 ichan, ictlno, kmin, kmax [, ifn]
    adest ctrl7 ichan, ictlno, kmin, kmax [, ifn] [, icutoff]
    ```

### Initialization

_idest_ -- output signal

_ichan_ -- MIDI channel (1-16)

_ictlno_ -- MIDI controller number (0-127)

_imin_ -- user-defined minimum floating-point value of output

_imax_ -- user-defined maximum floating-point value of output

_ifn_ (optional) -- table to be read when indexing is required. Table must be normalized. Output is scaled according to _imax_ and _imin_ val.

_icutoff_ (optional) -- low pass filter cut-off frequency for smoothing a-rate output.

### Performance

_kdest, adest_ -- output signal

_kmin_ -- user-defined minimum floating-point value of output

_kmax_ -- user-defined maximum floating-point value of output

_ctrl7_ (i- and k-rate 7 bit MIDI control) allows a floating-point 7-bit MIDI signal scaled with a minimum and a maximum range. It also allows optional non-interpolated table indexing. Minimum and maximum values can be varied at k-rate.

_ctrl7_ differs from [midic7](../opcodes/midic7.md) because it can be included in score-oriented instruments without Csound crashes. It also needs the additional parameter _ichan_ containing the MIDI channel of the controller.

The a-rate version of _ctrl7_ outputs an a-rate variable, which is low-pass filtered (smoothed). It contains an optional _icutoff_ parameter, to set the cutoff frecuency for the low-pass filter. The default is 5.

## Examples

Here is an example of the ctrl7 opcode. It uses the file [ctrl7.csd](../examples/ctrl7.csd).

``` csound-csd title="Example of the ctrl7 opcode." linenums="1"
--8<-- "examples/ctrl7.csd"
```

> :memo: **Note**
>
> ctrl7 only outputs k values once the controller is first moved. To set an initial k-value, a call to initc7 is required. Ctrlinit does not work for this purpose.

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.

The a-rate version of _ctrl7_ was added in version 5.06
