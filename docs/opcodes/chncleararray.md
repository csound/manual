<!--
id:chncleararray
category:Signal I/O:Software Bus
-->
# chncleararray
Sets the contents of one or more array channels to zero.

Use `chncleararray` after reading an array channel when its contents should not carry over to the next control cycle. The older spelling [chnclear_array](chnclear_array.md) calls the same implementation. Use `chncleararray` in new code.

## Syntax

=== "Modern"
    ``` csound-orc
    chncleararray(Sname1[, Sname2, ...])
    ```

=== "Classic"
    ``` csound-orc
    chncleararray Sname1[, Sname2, ...]
    ```

### Initialization

`Sname1, Sname2, ...` are the names of array channels to clear. Each argument is a string. The opcode has no output.

The channel names resolve at initialization. Changing a name string during performance does not redirect the call to another channel. A name that belongs to a different channel type causes an initialization error.

The call enables output access for each channel, preserving any existing input access. Declare the element type and dimensions with [chnarray](chn.md), or write an array with [chnset](chnset.md), before using the channel. `chncleararray` alone does not allocate an array of a particular shape.

### Performance

On each control cycle where it runs, `chncleararray` sets every element to zero. For an audio array, it clears every sample in each element's audio block. It works with multidimensional arrays too.

Clearing preserves the channel, its element type, dimensions and allocated storage. It does not clear the data during initialization.

Numeric and audio arrays are supported. String arrays and arrays of user-defined structures cause an error because their contents need type-specific cleanup. This opcode does not turn strings into empty strings or reset structure fields.

Call it after the last reader has used the channel in that control cycle. If readers and writers are in separate instruments, their performance order matters. A writer that runs after the clear can put new data into the channel immediately.

For a single audio channel, use [chnclear](chnclear.md). Here each name identifies a channel whose value is an array. Pass channel names as separate string arguments.

## Examples

Instrument 1 writes two audio signals into an array channel. Instrument 2 reads them as a stereo signal, then clears the channel. It runs after instrument 1 and stays active between notes, so the cleared channel supplies silence while no writer is playing.

It uses [chncleararray.csd](../examples/chncleararray.csd).

``` csound-csd title="Read and clear an audio array channel" linenums="1"
--8<-- "examples/chncleararray.csd"
```

## See also

[chnclear_array](chnclear_array.md), [chnclear](chnclear.md), [chnarray](chn.md), [chnget](chnget.md), [chnset](chnset.md), [Software Bus](../sigio/softbus.md)

## Credits

Author Victor Lazzarini, 2024.

New in Csound 7.
