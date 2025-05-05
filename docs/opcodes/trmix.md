<!--
id:trmix
category:Spectral Processing:Streaming
-->
# trmix
Streaming partial track mixing.

The _trmix_ opcode takes two inputs containg TRACKS pv streaming signals (as generated, for instance by _partials_) and mixes them into a single TRACKS stream. Tracks will be mixed up to the available space (defined by the original number of FFT bins in the analysed signals). If the sum of the input tracks exceeds this space, the higher-ordered tracks in the second input will be pruned.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = trmix(fin1, fin2)
    ```

=== "Classic"
    ``` csound-orc
    fsig trmix fin1, fin2
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_fin1_ -- first input pv stream in TRACKS format.

_fin2_ -- second input pv stream in TRACKS format

## Examples

Here is an example of the trmix opcode. It uses the file [trmix.csd](../examples/trmix.csd).

``` csound-csd title="Example of the trmix opcode." linenums="1"
--8<-- "examples/trmix.csd"
```

The example above shows partial tracking of an ifd-analysis signal, frequency splitting and pitch shifting of the upper part of the spectrum, followed by the remix of the two parts of the spectrum and resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
