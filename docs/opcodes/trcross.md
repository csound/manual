<!--
id:trcross
category:Spectral Processing:Streaming
-->
# trcross
Streaming partial track cross-synthesis.

The _trcross_ opcode takes two inputs containg TRACKS pv streaming signals (as generated, for instance by _partials_) and cross-synthesises them into a single TRACKS stream. Two different modes of operation are used: mode 0, cross-synthesis by multiplication of the amplitudes of the two inputs and mode 1, cross-synthesis by the substititution of the amplitudes of input 1 by the input 2. Frequencies and phases of input 1 are preserved in the output. The cross-synthesis is done by matching tracks between the two inputs using a 'search interval'. The matching algorithm will look for tracks in the second input that are within the search interval around each track in the first input. This interval can be changed at the control rate. Wider search intervals will find more matches.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = trcross(fin1, fin2, ksearch, kdepth [, kmode])
    ```

=== "Classic"
    ``` csound-orc
    fsig trcross fin1, fin2, ksearch, kdepth [, kmode]
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_fin1_ -- first input pv stream in TRACKS format.

_fin2_ -- second input pv stream in TRACKS format

_ksearch_ -- search interval ratio, defining a 'search area' around each track of 1st input for matching purposes.

_kdepth_ -- depth of effect (0-1).

_kmode_ -- mode of cross-synthesis. 0, multiplication of amplitudes (filtering), 1, subsitution of amplitudes of input 1 by input 2 (akin to vocoding). Defaults to 0.

## Examples

Here is an example of the trcross opcode. It uses the file [trcross.csd](../examples/trcross.csd).

``` csound-csd title="Example of the trcross opcode." linenums="1"
--8<-- "examples/trcross.csd"
```

The example above shows partial tracking of two ifd-analysis signals, cross-synthesis, followed by the remix of the two parts of the spectrum and resynthesis.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
