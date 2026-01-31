<!--
id:xscans
category:Signal Generators:Scanned Synthesis
status:deprecated
-->
# xscans
Fast scanned synthesis waveform and the wavetable generator.

Plugin opcode in scansyn.

Experimental version of [scans](../opcodes/scans.md).  Allows much larger matrices and is faster and smaller but removes some (unused?) flexibility.  If liked, it will replace the older opcode as it is syntax compatible but extended.

## Syntax
``` csound-orc
ares xscans kamp, kfreq, ifntraj, id [, iorder]
```

### Initialization

_ifntraj_ --  table containing the scanning trajectory. This is a series of numbers that contains addresses of masses. The order of these addresses is used as the scan path. It should not contain values greater than the number of masses, or negative numbers. See the [introduction to the scanned synthesis section](../siggen/scantop.md).

_id_ -- If positive, the ID of the opcode. This will be used to point the scanning opcode to the proper waveform maker. If this value is negative, the absolute of this value is the wavetable on which to write the waveshape. That wavetable can be used later from an other opcode to generate sound. The initial contents of this table will be destroyed.

_iorder_ (optional, default=0) -- order of interpolation used internally. It can take any value in the range 1 to 4, and defaults to 4, which is quartic interpolation. The setting of 2 is quadratic and 1 is linear. The higher numbers are slower, but not necessarily better.

### Performance

_kamp_  -- output amplitude. Note that the resulting amplitude is also dependent on instantaneous value in the wavetable. This number is effectively the scaling factor of the wavetable.

_kfreq_ -- frequency of the scan rate

## Examples

Here is an example of the xscans opcode. It uses the file [xscans.csd](../examples/xscans.csd).
``` csound-csd title="Example of the xscans opcode." linenums="1"
--8<-- "examples/xscans.csd"
```

For similar examples, see the documentation on [scans](../opcodes/scans.md).

## See Also

More information on Scanned Synthesis (as well as several other matrices) is available on the [Scanned Synthesis page](http://www.csounds.com/scanned/) at cSounds.com.

Also an article on these opcodes: [http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi

[scans](../opcodes/scans.md),
[xscanu](../opcodes/xscanu.md)

## Credits

Written by John ffitch.

New in version 4.20
