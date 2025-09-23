<!--
id:allpole
category:Spectral Processing:LPC
-->
# allpole
Allpole filter implementation using direct convolution.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = allpole(asig, kCoef[])
    ```

=== "Classic"
    ``` csound-orc
    ares allpole asig, kCoef[]
    ```

### Performance

_kCoef[]_ -- all-pole filter coefficients (iord-size array)

_asig_ -- audio input

_ares_ -- audio output

This opcode is part of a suite of streaming linear prediction opcodes. It implements an allpole filter using coefficients passed to it via a k-rate array. The filter length is determined by the array size.

The typical application is compute the coefficients via some method and then pass these to the opcode. The set of coefficients passed to allpole need to implement a stable filter, since this is an IIR filter and stability is not guaranteed by default.

The most common method of coefficient derivation is linear prediction analysis, produced for instance  by lpcanal. Other methods may be employed, including direct calculation of coefficients from a known filter recipe (e.g. resonators etc).

## Examples

=== "Modern"
    Here is an example of the allpole opcode using an audio input
    signal as lpc source. It uses the file [allpole-modern.csd](../examples/allpole-modern.csd).
    ``` csound-csd title="Example of the allpole opcode." linenums="1"
    --8<-- "examples/allpole-modern.csd"
    ```
    
=== "Classic"
    Here is an example of the allpole opcode using an audio input
    signal as lpc source. It uses the file [allpole.csd](../examples/allpole.csd).
    ``` csound-csd title="Example of the allpole opcode." linenums="1"
    --8<-- "examples/allpole.csd"
    ```
    
=== "Modern"
    Here is another example of the allpole opcode, now using a
    function table as lpc source. It uses the file [allpole-2-modern.csd](../examples/allpole-2-modern.csd).
    ``` csound-csd title="Another example of the allpole opcode." linenums="1"
    --8<-- "examples/allpole-2-modern.csd"
    ```

=== "Classic"
    Here is another example of the allpole opcode, now using a
    function table as lpc source. It uses the file [allpole-2.csd](../examples/allpole-2.csd).
    ``` csound-csd title="Another example of the allpole opcode." linenums="1"
    --8<-- "examples/allpole-2.csd"
    ```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)
