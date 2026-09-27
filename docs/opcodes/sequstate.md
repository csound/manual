<!--
id:sequstate
category:Instrument Control:Sensing and Control
-->
# sequstate
Reads a sequencer's event counter and current ordering of source indices.

Use `sequstate` with [sequ](sequencer.md) to inspect a sequence as it mutates or shuffles. It copies state without advancing playback or changing the sequence.

## Syntax

=== "Modern"
    ``` csound-orc
    icount, iorder[] = sequstate([iid])
    kcount, korder[] = sequstate([iid])
    ```

=== "Classic"
    ``` csound-orc
    icount, iorder[] sequstate [iid]
    kcount, korder[] sequstate [iid]
    ```

### Initialization

`iid` selects the sequence and defaults to 0. Use an integer from 0 to 9, matching the final argument of `sequ`. The input is i-rate in both forms. Values outside the range from 0 inclusive to 10 exclusive cause an initialization error. Fractional values within that range are truncated.

The selected `sequ` must initialize before `sequstate`. Place the reader after it in the same instrument, or start the sequence's instrument before a separate reader. Both forms of `sequ`, including the form with a starting-position argument, support state lookup.

IDs are shared across the Csound instance. Give each active sequence its own ID. If several use the same ID, the most recently initialized one replaces the registration for that ID.

The i-rate form returns a snapshot during initialization. Its outputs stay unchanged afterward. The k-rate form reads once during initialization and again on each control cycle. Both allocate a one-dimensional output array with as many elements as the sequence's source arrays, up to 128.

### Counter and ordering

`icount` and `kcount` return the internal event counter. It starts at 1 and increases after each processed step, including a rest whose instrument number is 0. After the first step it is 2. Waiting between steps does not increase it. A reset returns it to 1 before processing the reset step.

The counter does not give a loop count or a current position. Use the output of `sequ` to detect a step and read its position.

`iorder` and `korder` contain zero-based indices into the original rhythm, instrument and data arrays. A fresh sequence has the order `[0, 1, 2, ...]`. Mutation and shuffle modes change this mapping. The array contains source indices, not pitches, durations or a list of recently played notes.

Each read copies entries from 0 up to the sequence's active length. That length is truncated to an integer and limited to the range from 1 to the source array length. Entries beyond it do not describe the current state and may retain earlier values. The starting-position form of `sequ` still returns this full prefix, including positions below its playback start.

Place a k-rate reader after `sequ` to see its state after that cycle's work. Mutation can occur after a note has been scheduled, so the new mapping may already differ from the one used for that note. Keep the previous mapping if you need to identify the source index of the note just played.

### Lifetime

A missing or inactive ID causes an initialization error. A k-rate reader also reports an error if its sequence ends while the reader continues. Keep the reader within the sequence's lifetime. Do not shrink or reshape its output array while it runs.

## Examples

The example plays four notes and swaps two positions after every fourth event. It prints an initial snapshot, then prints the counter and updated order whenever `sequ` processes a step. The first performance reading has counter 2, while the initial snapshot has counter 1.

The snapshot stays unchanged as the live order changes. Both readers use ID 3 and run after the sequence in the same instrument.

It uses [sequstate.csd](../examples/sequstate.csd).

``` csound-csd title="Inspect a sequence as its note order changes" linenums="1"
--8<-- "examples/sequstate.csd"
```

## See also

[sequ](sequencer.md), [Sensing and Control](../control/sensing.md)

## Credits

Author John ffitch, 2022.
