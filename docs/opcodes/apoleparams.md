<!--
id:apoleparams
category:Spectral Processing:LPC
-->
# apoleparams
Extracts allpole filter parameters from coefficients.

This opcode takes an array of allpole filter coefficients and produces an array of allpole filter parameters as frequency and bandwidth pairs.

## Syntax
=== "Modern"
    ``` csound-orc
    kPar[] = apoleparams(kCoef[])
    ```

=== "Classic"
    ``` csound-orc
    kPar[] apoleparams kCoef[]
    ```

### Performance

_kCoef[]_ -- all-pole filter coefficients (iord-size array)

_kPar[]_ - filter parameters in freq-bandwidth pairs.

This opcode is part of a suite of streaming linear prediction opcodes. It takes in an array of allpole filter parameters, converts these to filter poles, sorts these in ascending frequency order, and then outputs these as frequency-bandwidth pairs. Poles at 0Hz and Nyquist frequencies are excluded, and each pole conjugate pair is represented by a single pair of parameters. For a filter of order M, M coefficients are transformed into M/2 pairs of frequencies and bandwidths.

## Examples

=== "Modern"
    Here is an example of the apoleparams opcode using an audio input
    signal as lpc source. It uses the file [apoleparams-modern.csd](../examples/apoleparams-modern.csd).
    ``` csound-csd title="Example of the apoleparams opcode." linenums="1"
    --8<-- "examples/apoleparams-modern.csd"
    ```

=== "Classic"
    Here is an example of the apoleparams opcode using an audio input
    signal as lpc source. It uses the file [apoleparams.csd](../examples/apoleparams.csd).
    ``` csound-csd title="Example of the apoleparams opcode." linenums="1"
    --8<-- "examples/apoleparams.csd"
    ```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)
