<!--
id:vco2init
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# vco2init
Calculates tables for use by vco2 opcode.

_vco2init_ calculates tables for use by [vco2](../opcodes/vco2.md) opcode. Optionally, it is also possible to access these tables as standard Csound function tables. In this case, [vco2ft](../opcodes/vco2ft.md) can be used to find the correct table number for a given oscillator frequency.

In most cases, this opcode is called from the orchestra header. Using _vco2init_ in instruments is possible but not recommended. This is because replacing tables during performance can result in a Csound crash if other opcodes are accessing the tables at the same time.

Note that _vco2init_ is not required for _vco2_ to work (tables are automatically allocated by the first _vco2_ call, if not done yet), however it can be useful in some cases:

* Pre-calculate tables at orchestra load time. This is useful to avoid generating the tables during performance, which could interrupt real-time processing.
* Share the tables as Csound ftables. By default, the tables can be accessed only by [vco2](../opcodes/vco2.md).
* Change the default parameters of tables (e.g. size) or use an user-defined waveform specified in a function table.

## Syntax
=== "Modern"
    ``` csound-orc
    ifn = vco2init(iwave [, ibasfn] [, ipmul] [, iminsiz] [, imaxsiz] [, isrcft])
    ```

=== "Classic"
    ``` csound-orc
    ifn vco2init iwave [, ibasfn] [, ipmul] [, iminsiz] [, imaxsiz] [, isrcft]
    ```

### Initialization

_ifn_ -- the first free ftable number after the allocated tables. If _ibasfn_ was not specified, -1 is returned.

_iwave_ -- sum of the following values selecting which waveforms are to be calculated:

* 16: triangle
* 8: square wave
* 4: pulse (not normalized)
* 2: 4 * x * (1 - x)   (integrated sawtooth)
* 1: sawtooth

Alternatively, _iwave_ can be set to a negative integer that selects an user-defined waveform. This also requires the _isrcft_ parameter to be specified. [vco2](../opcodes/vco2.md) can access waveform number -1. However, other user-defined waveforms are usable only with [vco2ft](../opcodes/vco2ft.md) or [vco2ift](../opcodes/vco2ift.md).

_ibasfn_ (optional, default=-1) -- ftable number from which the table set(s) can be accessed by opcodes other than _vco2_. This is required by user defined waveforms, with the exception of -1. If this value is less than 1, it is not possible to access the tables calculated by _vco2init_ as Csound function tables.

_ipmul_ (optional, default=1.05) -- multiplier value for number of harmonic partials. If one table has n partials, the next one will have n * _ipmul_ (at least n + 1). The allowed range for _ipmul_ is 1.01 to 2. Zero or negative values select the default (1.05).

_iminsiz_ (optional, default=-1) -- minimum table size.

_imaxsiz_ (optional, default=-1) -- maximum table size.

The actual table size is calculated by multiplying the square root of the number of harmonic partials by _iminsiz_, rounding up the result to the next power of two, and limiting this not to be greater than _imaxsiz_.

Both parameters, _iminsiz_ and _imaxsiz_, must be power of two, and in the allowed range. The allowed range is 16 to 262144 for _iminsiz_ to up to 16777216 for _imaxsiz_. Zero or negative values select the default settings:

* The minimum size is 128 for all waveforms except pulse (_iwave_=4). Its minimum size is 256.
* The default maximum size is usually the minimum size multiplied by 64, but not more than 16384 if possible. It is always at least the minimum size.

_isrcft_ (optional, default=-1) -- source ftable number for user-defined waveforms (if _iwave_ &lt; 0). _isrcft_ should point to a function table containing the waveform to be used for generating the table array. The table size is recommended to be at least _imaxsiz_ points. If _iwave_ is not negative (built-in waveforms are used), _isrcft_ is ignored.

> :warning: **Warning**
>
> The number and size of tables is not fixed. Orchestras should not depend on these parameters, as they are subject to changes between releases.
>
> If the selected table set already exists, it is replaced. If any opcode is accessing the tables at the same time, it is very likely that a crash will occur. This is why it is recommended to use _vco2init_ only in the orchestra header.
>
> These tables should not be replaced/overwritten by GEN routines or the _ftgen_ opcode. Otherwise, unpredictable behavior or a Csound crash may occur if [vco2](../opcodes/vco2.md) is used. The first free ftable after the table array(s) is returned in _ifn_.

## Examples

Here is an example of the vco2init opcode. It uses the file [vco2init.csd](../examples/vco2init.csd).

``` csound-orc title="Example of the vco2init opcode." linenums="1"
--8<-- "examples/vco2init.csd"
```

Its output should include a line like these:

```
i   1 time     0.00002:   103.00000
i   1 time     0.10000:   103.00000
i   1 time     0.20000:   103.00000
i   1 time     0.30002:   103.00000
i   1 time     0.40000:   104.00000
i   1 time     0.50000:   104.00000
.......
......
i   1 time     4.80002:   135.00000
i   1 time     4.90000:   136.00000
i   1 time     5.00000:   138.00000
```

See the example for the [vco2](../opcodes/vco2.md) opcode too.

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Author: Istvan Varga

New in version 4.22
