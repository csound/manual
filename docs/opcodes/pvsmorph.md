<!--
id:pvsmorph
category:Spectral Processing:Streaming
-->
# pvsmorph
Performs morphing (or interpolation) between two source fsigs.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmorph(fsig1, fsig2, kampint, kfrqint)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmorph fsig1, fsig2, kampint, kfrqint
    ```

### Performance

The operation of this opcode is similar to that of [pvinterp](../opcodes/pvinterp.md) (q.v.), except in using _fsig_s rather than analysis files, and the absence of spectral envelope preservation. The amplitudes and frequencies of _fsig1_ are interpolated with those of _fsig2_, depending on the values of _kampint_ and _kfrqint_, respectively. These range between 0 and 1, where 0 means _fsig1_ and 1, _fsig2_. Anything in between will interpolate amps and/or freqs of the two fsigs.

With this opcode, morphing can be performed on real-time audio input, by using [pvsanal](../opcodes/pvsanal.md) to generate _fsig1_ and _fsig2_. These must have the same format.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsmorph opcode. It uses the file [pvsmorph.csd](../examples/pvsmorph.csd).

``` csound-csd title="Example of the pvsmorph opcode." linenums="1"
--8<-- "examples/pvsmorph.csd"
```

Here is another example of the pvsmorph opcode. It uses the file [pvsmorph2.csd](../examples/pvsmorph2.csd).

``` csound-csd title="Example of the pvsmorph opcode." linenums="1"
--8<-- "examples/pvsmorph2.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
April 2007 <br>

New in Csound 5.06
