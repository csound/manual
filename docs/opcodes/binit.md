<!--
id:binit
category:Spectral Processing:Streaming
-->
# binit
PVS tracks to amplitude+frequency conversion.

The binit opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by partials) and converts it into a equal-bandwidth bin-frame containing amplitude and frequency pairs (PVS_AMP_FREQ), suitable for overlap-add resynthesis (such as performed by pvsynth) or further PVS streaming phase vocoder signal transformations. For each frequency bin, it will look for a suitable track signal to fill it; if not found, the bin will be empty (0 amplitude). If more than one track fits a certain bin, the one with highest amplitude will be chosen. This means that not all of the input signal is actually 'binned', the operation is lossy. However, in many situations this loss is not perceptually relevant.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = binit(fin, isize)
    ```

=== "Classic"
    ``` csound-orc
    fsig binit fin, isize
    ```

### Performance

_fsig_ -- output pv stream in PVS_AMP_FREQ format

_fin_ -- input pv stream in TRACKS format

_isize_ -- FFT size of output (N).

## Examples

=== "Modern"
    Here is an example of the binit opcode. It uses the file [binit-modern.csd](../examples/binit-modern.csd).
    ``` csound-csd title="Example of the binit opcode." linenums="1"
    --8<-- "examples/binit-modern.csd"
    ```

=== "Classic"
    Here is an example of the binit opcode. It uses the file [binit.csd](../examples/binit.csd).
    ``` csound-csd title="Example of the binit opcode." linenums="1"
    --8<-- "examples/binit.csd"
    ```

The example above shows partial tracking of an ifd-analysis signal, conversion to bin frames and overlap-add resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound5.01
