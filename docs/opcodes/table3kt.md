<!--
id:table3kt
category:Table Control:Dynamic Selection
-->
# table3kt
Reads a function table with cubic interpolation and a table number that can change at control rate.

Use `table3kt` to switch waveforms or lookup curves while an instrument runs. It works like [table3](table3.md), with a k-rate table number.

## Syntax

=== "Modern"
    ``` csound-orc
    ares = table3kt(andx, kfn [, ixmode] [, ixoff] [, iwrap])
    kres = table3kt(kndx, kfn [, ixmode] [, ixoff] [, iwrap])
    ```

=== "Classic"
    ``` csound-orc
    ares table3kt andx, kfn [, ixmode] [, ixoff] [, iwrap]
    kres table3kt kndx, kfn [, ixmode] [, ixoff] [, iwrap]
    ```

### Initialization

`ixmode` chooses the units for the index and offset. The default is 0, for positions measured in table elements. A nonzero value uses normalized positions, where 0 is the start and 1 is one full table length.

`ixoff` adds an offset to the index before lookup. It uses the same units as the index and defaults to 0. For example, 0.5 in normalized mode shifts the read position by half the table length.

`iwrap` selects boundary handling. Use 0 for limit mode or 1 for wrap mode. The default is 0.

### Performance

`andx` or `kndx` gives the read position. Use an audio-rate index for audio output and a control-rate index for control output. Fractional positions read between table elements. There is no initialization-only output form.

`kfn` selects the function table. Use an integer table number. The opcode looks up the table each control cycle, including for audio output, so changing `kfn` takes effect on the next lookup. Select an existing table with a valid length. A lookup failure reports an error and stops the instrument. Csound 7 also accepts 0 or -1 for its built-in sine table.

The selected tables can have different lengths, including lengths that are not powers of two. In normalized mode, the index and offset scale to the current table's length each control cycle. In raw mode, they stay in units of table elements.

Changing `kfn` switches tables directly. Cubic interpolation works between values within the selected table, not between table numbers. A switch can click if the two tables give different values at that position. Fade the output around the switch or crossfade two separate readers when you need a smooth change.

### Interpolation and boundaries

The opcode uses four neighboring values for cubic interpolation in the interior of a table. It uses linear interpolation in the first and last intervals, and throughout tables with fewer than four elements. Cubic interpolation can produce values beyond the range of the stored values.

The table's guard point supplies the value after the last element. For a repeating waveform, it should match the first element. [GEN10](../scoregens/gen10.md) creates this guard point, and [tablegpw](tablegpw.md) can update it after table writes.

In wrap mode, positions wrap by the table length. Negative positions wrap too. A normalized position of 1 returns to the start.

In limit mode, the integer part of an out-of-range position stops at the first or last element, but the fractional part still affects interpolation. This is not a strict clamp to an endpoint value. Keep the total index within the intended range when using limit mode. A normalized position of exactly 1 reads the last ordinary element, rather than the guard point.

## Examples

The example uses a 220 Hz phasor to read two waveforms. It starts with a sine wave and switches after two seconds to a table with three harmonics. The tables have different lengths, so normalized indexing keeps the pitch the same.

A short fade reaches zero at the switch. Wrap mode makes the phasor's repeating 0 to 1 range loop through each table.

It uses [table3kt.csd](../examples/table3kt.csd).

``` csound-csd title="Switch waveforms while keeping the same pitch" linenums="1"
--8<-- "examples/table3kt.csd"
```

## See also

[table3](table3.md), [tablekt](tablekt.md), [tableikt](tableikt.md), [tablexkt](tablexkt.md), [phasor](phasor.md), [Table reading with dynamic selection](../table/select.md)

## Credits

Author Victor Lazzarini, 2013.
