<!--
id:Zerodbfs
category:Orchestra Syntax:Header
-->
# 0dbfs
Sets the value of 0 decibels using full scale amplitude.

## Syntax
``` csound-orc
0dbfs = iarg
0dbfs
```

### Initialization

_iarg_ -- the value of 0 decibels using full scale amplitude.

### Performance

The default is 32768. Set `0dbfs = 1` in the orchestra header to use amplitudes from -1 to 1 for full-scale output.

When converting an older orchestra that uses the default, divide its absolute signal amplitudes by 32768 to keep a similar output level. For example, an oscillator amplitude of 10000 becomes about `0.3`. Scale amplitude envelopes and thresholds too. Leave frequencies, times and relative gains unchanged. Values based on `0dbfs` or `ampdbfs()` already follow the new scale.

Csound uses this value to scale audio for the output format. It does not limit internal signals to that range. Signals above full scale can clip at the audio device or when written to an integer sound file.

0dBFS can be defined in the header, to set the amplitude reference Csound will use, but it can also be used as a varible inside instruments like this:

``` csound-orc
ipeak 0dbfs
```

``` csound-orc
asig 0dbfs, freq, 1
0dbfs
```

The purpose of the _0dbfs_ opcode is for people to start to code 0dbfs-relatively (and use the [ampdbfs()](../opcodes/ampdbfs.md) opcodes a lot more!), rather than use explicit sample values. Using 0dbfs=1 is in accordance to industry practice, as ranges from -1 to 1 are used in most commercial plugin formats and in most other synthesis systems like Pure Data.

Floats written to a file, when _0dbfs = 1_, will in effect go through no range translation at all. So the numbers in the file are exactly what the orc says they are.

For more details on amplitude values in Csound, see the section [Amplitude values in Csound](../orch/amplitudes.md)

## Examples

=== "Modern"
    Here is an example of the 0dbfs opcode. It uses the file [0dbfs-modern.csd](../examples/0dbfs-modern.csd).
    ``` csound-csd title="Example of the 0dbfs opcode." linenums="1"
    --8<-- "examples/0dbfs-modern.csd"
    ```

=== "Classic"
    Here is an example of the 0dbfs opcode. It uses the file [0dbfs.csd](../examples/0dbfs.csd).
    ``` csound-csd title="Example of the 0dbfs opcode." linenums="1"
    --8<-- "examples/0dbfs.csd"
    ```

## See also
Sets the value of 0 decibels using full scale amplitude.


[Orchestra Header Statements](../orch/header.md)

## Credits

Author: Richard Dobson<br>
May 2002<br>

New in version 4.10
