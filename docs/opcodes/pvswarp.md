<!--
id:pvswarp
category:Spectral Processing:Streaming
-->
# pvswarp
Warp the spectral envelope of a PVS signal by means of shifting and scaling.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvswarp(fsigin, kscal, kshift [, klowest, kmeth, kgain, kcoefs])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvswarp fsigin, kscal, kshift [, klowest, kmeth, kgain, kcoefs]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream

_kscal_ -- spectral envelope scaling ratio. Values > 1 stretch the envelope and &lt; 1 compress it.

_kshift_ -- spectral envelope shift (in Hz), values > 0 shift the envelope linearly upwards and values &lt; 0 shift it downwards.

_klowest_ -- lowest frequency shifted (affects only kshift, defaults to 0).

_kmethod_ -- spectral envelope extraction method. 1: liftered cepstrum method; 2: true envelope method (defaults to 1).

_kgain_ -- amplitude scaling (defaults to 1).

_kcoefs_ -- number of cepstrum coefs used in formant preservation (defaults to 80).

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvswarp opcode. It uses the file [pvswarp.csd](../examples/pvswarp.csd).

``` csound-csd title="Example of the pvswarp opcode." linenums="1"
--8<-- "examples/pvswarp.csd"
```

Used with vocal sounds, it will shift the formants and result in a changed vowel timbre, similar to the effect of a singer inhaling helium (the 'donald duck' effect).

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
