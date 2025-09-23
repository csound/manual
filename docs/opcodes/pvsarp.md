<!--
id:pvsarp
category:Spectral Processing:Streaming
-->
# pvsarp
Arpeggiate the spectral components of a streaming pv signal.

This opcode arpeggiates spectral components, by amplifying one bin and attenuating all the others around it. Used with an LFO it will provide a spectral arpeggiator similar to Trevor Wishart's CDP program specarp.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsarp(fsigin, kbin, kdepth, kgain)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsarp fsigin, kbin, kdepth, kgain
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream

_kbin_ -- target bin, normalised 0 - 1 (0Hz - Nyquist).

_kdepth_ -- depth of attenuation of surrounding bins

_kgain_ -- gain boost applied to target bin

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsarp opcode. It uses the file [pvsarp.csd](../examples/pvsarp.csd)

``` csound-csd title="Example of the pvsarp opcode." linenums="1"
--8<-- "examples/pvsarp.csd"
```

Here is another example of the pvsarp opcode. It uses the file [pvsarp2.csd](../examples/pvsarp2.csd)

``` csound-csd title="Example of the pvsarp opcode." linenums="1"
--8<-- "examples/pvsarp2.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
April 2005 <br>

New plugin in version 5

April 2005.
