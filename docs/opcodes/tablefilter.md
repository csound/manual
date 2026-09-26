<!--
id:tablefilter
category:Table Control:Read/Write Operations
-->
# tablefilter
Filters table values or converts onset times to intervals.

`tablefilter` reads a source table and writes the result to a destination table on each control cycle. It returns the number of values written.

## Syntax
=== "Modern"
    ``` csound-orc
    knumpassed = tablefilter(kouttable, kintable, kmode, kparam)
    ```

=== "Classic"
    ``` csound-orc
    knumpassed tablefilter kouttable, kintable, kmode, kparam
    ```

### Performance

_knumpassed_ is the number of values written, starting at index 0. Values after this count in the destination table stay unchanged.

_kouttable_ is the destination table number.

_kintable_ is the source table number. The destination length sets how many source values the opcode examines. Use tables of equal length to read the source once. If the destination is longer, reading starts again at the beginning of the source.

_kmode_ selects the operation.

| Mode | Operation |
| --- | --- |
| 1 | Keep values whose denominator weight is less than or equal to the threshold weight. |
| 2 | Keep values whose denominator weight is greater than or equal to the threshold weight. |
| 3 | Convert nonzero onset times to intervals. |

_kparam_ is an integer whose weight sets the threshold for modes 1 and 2. The opcode approximates each source value as a fraction and compares the denominator's weight with the weight of this integer. Both modes include equal weights. For example, `1/2` passes both filters when the threshold is 2.

The weight follows Clarence Barlow's indigestibility function. It depends on the integer's prime factors and how often they occur. Larger prime factors add more weight.

### Onsets to intervals

Mode 3 reads onset times in table order. It skips zero values and subtracts the previous nonzero onset from each remaining onset. The starting point is zero, so the first interval equals the first nonzero onset. Repeated nonzero onsets produce a zero interval.

For example, onsets `0.25, 0.5, 0.75, 1` give four intervals of `0.25`. The intervals use the same units as the onsets. They can serve as the durations between notes in a rhythmic pattern.

Mode 3 ignores _kparam_. Pass 1 for this argument. The source and destination can share a table, which replaces the onsets with their intervals.

For conversion in place, call `tablefilter` only when you want to replace the current onsets. Calling it again on the next control cycle would convert the intervals themselves. Use a separate destination to keep reading the original onsets on every cycle.

### Compatibility

Conversion in place and weights for prime factors above 9973 require the fixes in [Csound PR #3278](https://github.com/csound/csound/pull/3278). In builds without these fixes, use a separate destination for mode 3. Modes 1 and 2 can give incorrect results when a denominator or threshold contains a prime factor above 9973.

## Examples

The [tablefilter.csd](../examples/tablefilter.csd) example filters a Farey sequence by denominator weight.

``` csound-csd title="Filter a Farey sequence" linenums="1"
--8<-- "examples/tablefilter.csd"
```

The [tablefilter_intervals.csd](../examples/tablefilter_intervals.csd) example converts onset times to intervals at initialization and at performance time. Both forms print four intervals of `0.25`.

``` csound-csd title="Convert onsets to intervals" linenums="1"
--8<-- "examples/tablefilter_intervals.csd"
```

## See also

[tablefilteri](tablefilteri.md), [GENfarey](../scoregens/genfarey.md), [Read/Write Operations](../table/readwrit.md)

## Credits

Author Georg Boenn<br>
University of Glamorgan, UK<br>

New in Csound version 5.13
