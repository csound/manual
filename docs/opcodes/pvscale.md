<!--
id:pvscale
category:Spectral Processing:Streaming
-->
# pvscale
Scale the frequency components of a pv stream, resulting in pitch shift.

Output amplitudes can be optionally modified in order to attempt formant preservation.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvscale(fsigin, kscal [, kkeepform, kgain, kcoefs])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvscale fsigin, kscal [, kkeepform, kgain, kcoefs]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream

_kscal_ -- scaling ratio.

_kkeepform_ -- attempt to keep input signal formants; 0: do not keep formants; 1: keep formants using a liftered cepstrum method; 2: keep formants by using a true envelope method (defaults to 0).

_kgain_ -- amplitude scaling (defaults to 1).

_kcoefs_ -- number of cepstrum coefs used in formant preservation (defaults to 80).

The quality of the pitch shift will be improved with the use of a Hanning window in the pvoc analysis. Formant preservation method 1 is less intensive than method 2, which might not be suited to realtime use.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

``` csound-orc
asig  in                                 ; get the signal in

fsig  pvsanal   asig, 1024, 256, 1024, 1 ; analyse it
ftps  pvscale   fsig, 1.5, 1, 1          ; transpose it keeping formants
atps  pvsynth   ftps                     ; synthesise it

adp   delayr    0.1                      ; delay original signal
adel  deltapn   1024                     ; by 1024 samples
      delayw    asig
      out       atps + adel              ; add tranposed and original
```

The example above shows a vocal harmoniser. The delay is necessary to time-align the signals, as the analysis-synthesis process will imply a delay of 1024 samples between the analysis input and the synthesis output.

Here is an example of the use of the _pvscale_ opcode. It uses the file [pvscale.csd](../examples/pvscale.csd).

``` csound-csd title="Example of the _pvscale_ opcode." linenums="1"
--8<-- "examples/pvscale.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
