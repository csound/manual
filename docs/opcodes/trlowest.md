<!--
id:trlowest
category:Spectral Processing:Streaming
-->
# trlowest
Extracts the lowest-frequency track from a streaming track input signal.

The _trlowest_ opcode takes an input containg TRACKS pv streaming signals (as generated, for instance by _partials_) and outputs only the lowest track. In addition it outputs two k-rate signals, corresponding to the frequency and amplitude of the lowest track signal.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig, kfr, kamp = trlowest(fin1, kscal)
    ```

=== "Classic"
    ``` csound-orc
    fsig, kfr, kamp trlowest fin1, kscal
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_kfr_ -- frequency (in Hz) of the lowest-frequency track

_kamp_ -- amplitude of the lowest-frequency track

_fin_ -- input pv stream in TRACKS format.

_kscal_ -- amplitude scaling of output.

## Examples

Here is an example of the trlowest opcode. It uses the file [trlowest.csd](../examples/trlowest.csd).

``` csound-csd title="Example of the trlowest opcode." linenums="1"
--8<-- "examples/trlowest.csd"
```

The example above shows partial tracking of an ifd-analysis signal, extraction of the lowest frequency and resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
