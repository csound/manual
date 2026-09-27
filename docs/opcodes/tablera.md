<!--
id:tablera
category:Table Control:Read/Write Operations
-->
# tablera
Reads successive function-table values into an audio block.

Use it with [tablewa](tablewa.md) to process table values with audio-rate code.

## Syntax

=== "Modern"
    ``` csound-orc
    asig = tablera(kfn, kstart, koff)
    ```

=== "Classic"
    ``` csound-orc
    asig tablera kfn, kstart, koff
    ```

### Performance

_asig_ -- the audio block read from the table.

_kfn_ -- the number of the source table.

_kstart_ -- the starting position in table locations. `tablera` reads this input on each call and does not change it.

_koff_ -- an offset added to _kstart_ on each call. Use integer positions and offsets. Their sum must be nonnegative.

Each call reads the active samples of one audio block, normally `ksmps` values, starting at `kstart + koff`. The index wraps at the table length. This also allows a block to read a short table more than once. Tables can have power-of-two or non-power-of-two lengths.

Positions count table locations, without interpolation or normalization to a 0-to-1 range. `tablera` does not read the guard point.

To read successive blocks, advance _kstart_ in your code. The companion `tablewa` opcode keeps its own internal write position. Its returned position can equal the table length, so a processing loop should count the values processed rather than wait for it to return zero.

## Examples

[tablewa.csd](../examples/tablewa.csd) defines a source and destination table. It reads four values at a time with `tablera`, takes their natural logarithms and writes them with `tablewa`. A bounded loop processes all 16 values once.

``` csound-csd title="Read and process a whole table" linenums="1"
--8<-- "examples/tablewa.csd"
```

See [tablewa's audio-block example](tablewa.md#process-each-sample-of-an-audio-block) for a complete example that writes an audio block to a table, processes each sample in a k-rate loop and reads the block back with `tablera`.

## See also

[tablewa](tablewa.md), [Read/Write Operations](../table/readwrit.md)
