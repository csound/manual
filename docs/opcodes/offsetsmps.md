<!--
id:offsetsmps
category:Signal Modifiers:Sample Level Operators
-->
# offsetsmps
Returns the number of inactive samples before a note starts in the current control block.

## Syntax

=== "Modern"
    ``` csound-orc
    kOffset = offsetsmps()
    ```

=== "Classic"
    ``` csound-orc
    kOffset offsetsmps
    ```

### Performance

`kOffset` is a count in samples, updated on each control cycle. There are no input arguments. The opcode runs at k-rate only.

With [--sample-accurate](../invoke/cs-options-alphabetically.md#-sample-accurate), a note can start partway through a control block. `offsetsmps` gives the index of its first active sample in that block. It returns 0 on later control cycles, when the note starts on a block boundary, or when sample-accurate timing is off.

The offset is relative to the current control block. Its value ranges from 0 to `ksmps - 1`. With a local [ksmps](ksmps.md) in an instrument or user-defined opcode, it refers to that smaller block. Divide the offset by [sr](sr.md) to express it in seconds.

Use this value as the first index in a sample-by-sample loop. To exclude inactive samples at the end of the note too, stop before `ksmps - earlysmps()`. Csound's sample-accurate option does not apply to tied notes or change MIDI timing.

## Examples

A custom oscillator must advance its phase only for samples that belong to the note. If it advances through the inactive part of the first block, the note starts at the wrong phase.

This example writes a sine wave one sample at a time. It leaves the inactive samples at zero and uses `offsetsmps` to find where to begin. It uses [offsetsmps.csd](../examples/offsetsmps.csd).

``` csound-csd title="Start a custom oscillator at the note boundary" linenums="1"
--8<-- "examples/offsetsmps.csd"
```

The note starts at sample 375. With `ksmps` set to 64, that falls 55 samples into its first block. The printed offset starts at 55 and changes to 0 for the following blocks. The oscillator begins with phase zero at the note's first active sample.

## See also

[vaget](vaget.md), [vaset](vaset.md), [setksmps](setksmps.md), [Sample Level Operators](../sigmod/sample.md)

## Credits

Author Victor Lazzarini.
December 2024.

New in Csound 7.
