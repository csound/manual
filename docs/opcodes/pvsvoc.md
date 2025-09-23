<!--
id:pvsvoc
category:Spectral Processing:Streaming
-->
# pvsvoc
Combine the spectral envelope of one fsig with the excitation (frequencies) of another.

This opcode provides support for cross-synthesis of amplitudes and frequencies. It takes the amplitudes of one input fsig and combines with frequencies from another. It is a spectral version of the well-known channel vocoder.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsvoc(famp, fexc, kdepth, kgain [, kcoefs])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsvoc famp, fexc, kdepth, kgain [, kcoefs]
    ```

### Performance

_fsig_ -- output pv stream

_famp_ -- input pv stream from which the amplitudes will be extracted

_fexc_ -- input pv stream from which the frequencies will be taken

_kdepth_ -- depth of effect, affecting how much of the frequencies will be taken from the second fsig: 0, the output is the famp signal, 1 the output is the famp amplitudes and fexc frequencies.

_kgain_ -- gain boost/attenuation applied to the output.

_kcoefs_ -- number of cepstrum coefs used in spectral envelope estimation (defaults to 80).

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsvoc opcode. It uses the file [pvsvoc.csd](../examples/pvsvoc.csd).

``` csound-csd title="Example of the pvsvoc opcode." linenums="1"
--8<-- "examples/pvsvoc.csd"
```

The example above shows a typical cross-synthesis operation. The input signal (say a vocal sound) is used for its amplitude spectrum. An oscillator with an arbitrary complex waveform produces the excitation signal, giving the vocal sound its pitch.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
April 2005 <br>

New plugin in version 5

April 2005.
