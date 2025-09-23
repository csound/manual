<!--
id:trhighest
category:Spectral Processing:Streaming
-->
# trhighest
Extracts the highest-frequency track from a streaming track input signal.

The _trhighest_ opcode takes an input containg TRACKS pv streaming signals (as generated, for instance by _partials_) and outputs only the highest track. In addition it outputs two k-rate signals, corresponding to the frequency and amplitude of the highest track signal.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig, kfr, kamp = trhighest(fin1, kscal)
    ```

=== "Classic"
    ``` csound-orc
    fsig, kfr, kamp trhighest fin1, kscal
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_kfr_ -- frequency (in Hz) of the highest-frequency track

_kamp_ -- amplitude of the highest-frequency track

_fin_ -- input pv stream in TRACKS format.

_kscal_ -- amplitude scaling of output.

## Examples

Here is an example of the trhighest opcode. It uses the file [trhighest.csd](../examples/trhighest.csd).

``` csound-csd title="Example of the trhighest opcode." linenums="1"
--8<-- "examples/trhighest.csd"
```

The example above shows partial tracking of an ifd-analysis signal, extraction of the highest frequency and resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
