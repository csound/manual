<!--
id:getp
category:Instrument Control:Realtime Performance Control
-->
# getp
Reads one output from an opcode object.

Use `getp` to copy an output that an `Opcode` object has already produced. You can change which output you read during performance without running the object again.

## Syntax

=== "Modern"
    ``` csound-orc
    xvalue = getp(object, kindex)
    ```

=== "Classic"
    ``` csound-orc
    xvalue getp object, kindex
    ```

### Initialization and performance

`object` is an `Opcode` object made with [create](create.md).

`kindex` selects an output by position, starting at 0. For an opcode with two outputs, 0 selects the first and 1 selects the second. Supply a whole number within the object's output count. Fractional indexes truncate toward zero, and negative indexes select output 0. An index past the last output causes an error.

`xvalue` is a placeholder for a variable whose type and rate match the selected output. For example, a k-rate output needs a k-rate destination, and an audio output needs an audio destination. `getp` does not convert between rates or types. If you change `kindex`, every selected output must match the destination.

Initialize the object with `init` or `run` before reading its outputs. During performance, place `getp` after `run` or [perf](perf.md) to read the current control cycle's result. `getp` copies the output at initialization and on performance passes where the call runs. It does not advance the object's state.

For an opcode that has only a performance routine, the first `perf` call must run before `getp` reads it during performance. If its outputs are not yet bound, `getp` skips the initialization copy.

Numeric array outputs are also supported. They use separate destination storage, which must have enough capacity before performance begins. A copy that would require more storage during performance causes an error. Strings, user-defined structures and arrays containing values that need their own cleanup are currently unsupported.

Keep the object alive while reading it. If you pass it between instruments, their sample rates must match and the reader's `ksmps` must not exceed the object's `ksmps`.

### Instrument p-fields

The index counts opcode outputs. It does not refer to score fields such as p4 or p5, and `getp` does not accept an `Instr` object. To read a p-field in the current instrument, use p4, p5 and so on, or [pindex](pindex.md) for a variable field number.

## Examples

This example makes an opcode object with two pitch outputs. `getp` selects the root or the fifth once per second, and an oscillator plays the selected pitch. Both outputs are k-rate values, so the same destination can read either one.

It uses [getp.csd](../examples/getp.csd).

``` csound-csd title="Choose between two opcode outputs" linenums="1"
--8<-- "examples/getp.csd"
```

## See also

[create](create.md), [init](init.md), [perf](perf.md), [delete](delete.md), [opcodeinfo](opcodeinfo.md), [pindex](pindex.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
