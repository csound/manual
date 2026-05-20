<!--
id:mkir
category:Utilities
-->
# mkdir
Provides support for the preparation of empirical impulse responses (IRs).


## Syntax
```
csound -U mkir [-flags] sweepfile 
mkir [-flags] sweepfile 
```

### Initialization

There are two operation modes: sweep file generation and IR processing. The first is used to create sweep files for measuring IRs. This is used to capture a
measurement, playback through a system whose IR we want to estimate. The second takes a recording from a measurement, the sweep file used, and produces an output IR.

_-g_  -- generate sine sweep. The *sweepfile* argument gives the output file name, which is a RIFF-Wave format with IEEE 32-bit float encoding.

_-t length_ -- sweep file length in seconds (generation mode), defaults to 1.

_-r rate_ --  sampling rate for sweep generation (defaults to 44100)

_-o output_ -- output IR file (processing mode).

_-i input_ -- input IR file (processing mode).


## Examples

```
mkir -g sweep.wav -t 5
```

produces a sweep file lasting 5 seconds.

```
mkir sweep.wav -i rev.wav -o ir.wav
```

produces an IR file from a sweep and recording of the IR measurement.

## Credits

Author: Victor Lazzarini

Maynooth University Ireland

2026
