<!--
id:tablewa
category:Table Control:Read/Write Operations
-->
# tablewa
Writes an audio block to successive locations in a function table.

Use it with [tablera](tablera.md) to process table values with audio-rate code, or to pass an audio block through a table for sample-by-sample processing.

## Syntax

=== "Modern"
    ``` csound-orc
    kstart = tablewa(kfn, asig, koff[, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kstart tablewa kfn, asig, koff[, iskip]
    ```

### Initialization

_iskip_ -- optional flag, default 1. If zero, reset the internal write position to zero at initialization. Otherwise, keep its existing position. A new instance starts at zero. In either case, add _koff_ to the position during initialization.

### Performance

_kstart_ -- the position after the last sample written. This is an output. Assigning a value to it does not move the internal write position.

_kfn_ -- the number of the destination table. It can change at k-rate.

_asig_ -- the audio signal to write.

_koff_ -- offset in table locations, added to the internal position at initialization. Although this argument accepts a k-rate variable, changes during performance do not move the write position. Use an integer offset. The resulting position must be nonnegative.

Each call writes the active samples of one audio block, normally `ksmps` samples. The next call continues from the stored position. Writing wraps to the start of the table when it reaches the end. Tables can have power-of-two or non-power-of-two lengths. If a table is shorter than the block, later samples overwrite earlier ones in the same call.

The returned position can equal the table length. It is not a zero-valued end marker. For a table of 16 values and `ksmps = 5`, successive calls behave as follows.

| Call | Position before writing | Returned kstart | Locations written |
|---|---|---|---|
| 1 | 0 | 5 | 0 1 2 3 4 |
| 2 | 5 | 10 | 5 6 7 8 9 |
| 3 | 10 | 15 | 10 11 12 13 14 |
| 4 | 15 | 4 | 15 0 1 2 3 |

`tablewa` leaves the guard point unchanged. Use [tablegpw](tablegpw.md) if later reads need it to match the first value.

## Examples

### Process a whole table

[tablewa.csd](../examples/tablewa.csd) reads 16 positive values with `tablera`, takes their natural logarithms and writes the results to a second table. Both tables are defined in the example. A negative GEN02 number keeps the supplied values without normalization.

The loop processes four values per pass. It counts the values read and stops at the table length. After the fourth pass, `kNext` is 16. The loop runs once, during the instrument's first control cycle.

``` csound-csd title="Process a table with audio-rate code" linenums="1"
--8<-- "examples/tablewa.csd"
```

The printed output starts and ends with these values.

``` text
Next write position = 16
table[ 0] = 0.000000
table[ 1] = 0.693147
...
table[15] = 2.772589
```

Here, `ksmps` divides the table length exactly. If you adapt the loop to another block size, account for wrapping in the last block.

### Process each sample of an audio block

[tablewa-block.csd](../examples/tablewa-block.csd) writes a sine wave to a table of `ksmps` values. A k-rate loop halves each sample, then `tablera` reads the block back for output. The input amplitude is 0.4 and the output amplitude is 0.2.

``` csound-csd title="Process an audio block through a table" linenums="1"
--8<-- "examples/tablewa-block.csd"
```

The loop runs once per sample in the block. A stateful opcode inside it would also run once per iteration, so time-dependent k-rate opcodes need care in this kind of loop.

## See also

[tablera](tablera.md), [tablew](tablew.md), [Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
