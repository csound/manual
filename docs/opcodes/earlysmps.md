<!--
id:earlysmps
category:Signal Modifiers:Sample Level Operators
-->
# earlysmps
Returns the number of inactive samples at the end of the current control block.

## Syntax

=== "Modern"
    ``` csound-orc
    kEarly = earlysmps()
    ```

=== "Classic"
    ``` csound-orc
    kEarly earlysmps
    ```

### Performance

`kEarly` is a count in samples, updated on each control cycle. There are no input arguments.

With [--sample-accurate](../invoke/cs-options-alphabetically.md#-sample-accurate), a note can end partway through a control block. `earlysmps` reports how many samples at the end of that block fall after the note's end. It returns 0 for blocks with no inactive tail, including a final block that ends exactly at the note boundary. Without this option, it returns 0.

The count refers to the block in the current instrument or user-defined opcode. With a local [ksmps](ksmps.md), it refers to that smaller block. A zero result alone does not tell you whether the note will continue.

For a sample loop, stop before index `ksmps - kEarly`. The `offsetsmps` opcode gives the first active sample index when a note starts partway through a block. Using both bounds keeps the loop within the samples that belong to the note.

## Examples

A custom RMS meter needs to exclude inactive samples from both its sum and its sample count. Otherwise, the zero padding can lower the reading for a short final block.

This example measures a constant signal with a value of 0.25. The note lasts 750 samples. With `ksmps` set to 64, its last block has 46 active samples and 18 inactive samples. The example prints the final count and RMS without producing audio. It uses [earlysmps.csd](../examples/earlysmps.csd).

``` csound-csd title="Measure only the active samples in a block" linenums="1"
--8<-- "examples/earlysmps.csd"
```

Expected output includes these lines.

``` text
Final block has 46 active samples and 18 inactive samples
RMS of the active samples is 0.25
```

## See also

[vaget](vaget.md), [vaset](vaset.md), [setksmps](setksmps.md), [Sample Level Operators](../sigmod/sample.md)

## Credits

Author Victor Lazzarini.
December 2024.

New in Csound 7.
