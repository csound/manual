<!--
id:pvshift
category:Spectral Processing:Streaming
-->
# pvshift
Shift the frequency components of a pv stream, stretching/compressing its spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvshift(fsigin, kshift, klowest [, kkeepform, igain, kcoefs])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvshift fsigin, kshift, klowest [, kkeepform, igain, kcoefs]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream

_kshift_ -- shift amount (in Hz, positive or negative).

_klowest_ -- lowest frequency to be shifted.

_kkeepform_ -- attempt to keep input signal formants; 0: do not keep formants; 1: keep formants using a liftered cepstrum method; 2: keep formants by using a true envelope method
(defaults to 0).

_kgain_ -- amplitude scaling (defaults to 1).

_kcoefs_ -- number of cepstrum coefs used in formant preservation (defaults to 80).

This opcode will shift the components of a pv stream, from a certain frequency upwards, up or down a fixed amount (in Hz). It can be used to transform a harmonic spectrum into an inharmonic one. The _kkeepform_ flag can be used to try and preserve formants for possibly interesting and unusual spectral modifications.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

``` csound-orc
asig  in                                 ; get the signal in

fsig  pvsanal   asig, 1024, 256, 1024, 1 ; analyse it
ftps  pvshift   fsig, 100, 0             ; add 100 Hz to each component
atps  pvsynth   ftps                     ; synthesise it
```

Depending on the input, this will transform a pitched sound into an inharmonic, bell-like sound.

Here is an example of the use of the _pvshift_ opcode. It uses the file [pvshift.csd](../examples/pvshift.csd).

``` csound-csd title="Example of the _pvshift_ opcode." linenums="1"
--8<-- "examples/pvshift.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
