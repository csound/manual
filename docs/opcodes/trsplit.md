<!--
id:trsplit
category:Spectral Processing:Streaming
-->
# trsplit
Streaming partial track frequency splitting.

The _trsplit_ opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by _partials_) and splits it into two signals according to a k-rate frequency 'split point'. The first output will contain all tracks up from 0Hz to the split frequency and the second will contain the tracks from the split frequency up to the Nyquist. It can also, optionally, scale the gain of the output signals by a k-rate amount (default 1). The result is two output signals containing only part of the original spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    fsiglow, fsighi = trsplit(fin, ksplit [, kgainlow, kgainhigh])
    ```

=== "Classic"
    ``` csound-orc
    fsiglow, fsighi trsplit fin, ksplit [, kgainlow, kgainhigh]
    ```

### Performance

_fsiglow_ -- output pv stream in TRACKS format containing the tracks below the split point.

_fsighi_ -- output pv stream in TRACKS format containing the tracks above and including the split point.

_fin_ -- input pv stream in TRACKS format

_ksplit_ -- frequency split point in Hz

_kgainlow, kgainhig_ -- amplitude scaling of each one of the outputs (default 1).

## Examples

Here is an example of the trsplit opcode. It uses the file [trsplit.csd](../examples/trsplit.csd).

``` csound-csd title="Example of the trsplit opcode." linenums="1"
--8<-- "examples/trsplit.csd"
```

The example above shows partial tracking of an ifd-analysis signal and linear additive resynthesis of the upper part of the spectrum (from 1500Hz).

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
