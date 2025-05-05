<!--
id:part2txt
category:Spectral Processing:Streaming
-->
# part2txt
Write a text file containing partial tracks data.

The part2txt opcode takes a PVS_TRACKS fsig input and writes the data as sequence of track lists, one for each time point, to a line-oriented text file. Each track is placed on a separate line containing the amplitude, frequency, phase, and track ID. A separator line containing four -1.0 values is used to define the end of the track list for a given time point.

## Syntax
=== "Modern"
    ``` csound-orc
    part2txt(SFile, ftrks)
    ```

=== "Classic"
    ``` csound-orc
    part2txt SFile, ftrks
    ```

### Initialization

_SFile_ -- output filename

### Performance

_ftrks_ -- output pv stream in TRACKS format

## Examples

Here is an example of the part2txt opcodes. It uses the file [part2txt.csd](../examples/part2txt.csd).

``` csound-csd title="Example of the part2txt opcodes." linenums="1"
--8<-- "examples/part2txt.csd"
```

The example above shows partial tracking of an ifd-analysis signal and cubic-phase additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2015 <br>
