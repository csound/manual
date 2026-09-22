<!--
id:run
category:Instrument Control:Realtime Performance Control
-->
# run
Initializes and performs an opcode object or an array of opcode objects.

Use `run` after [create](create.md) to execute an opcode with its own state. An array of objects can make a bank of oscillators or filters, with separate settings for each object.

## Syntax

=== "Modern"
    ``` csound-orc
    [xout1, ... =] run(object, xin1, ...)
    [xout1, ... =] run(objects, xin1, ...)
    ```

=== "Classic"
    ``` csound-orc
    [xout1, ...] run object, xin1, ...
    [xout1, ...] run objects, xin1, ...
    ```

### Initialization

`object` is an `Opcode` made with [create](create.md). `objects` is a one-dimensional `Opcode[]` made by supplying an array length to `create`.

`xin1, ...` are the inputs of the chosen opcode. `xout1, ...` are its outputs. Their number, order, types and rates must match the overload selected when the object was created. An opcode with no inputs needs only the object argument. An opcode with no outputs needs no output variables.

`run` connects the arguments and calls the object's initialization routine, if it has one. It uses the chosen opcode's defaults for omitted optional inputs. It does not choose an overload from the arguments. Use [opcodeinfo](opcodeinfo.md) to inspect overloads and the optional overload number in `create` to select one.

### Performance

On each control cycle where the call runs, `run` calls the object's performance routine, if it has one. Audio outputs contain a block of samples. The object's state carries over between calls, so an oscillator keeps its phase and a filter keeps its history.

For separate control of initialization and performance on a single object, use [init](init.md) followed by [perf](perf.md). Avoid running the same object through both `run` and `perf` in one control cycle, since each call advances its state.

Keep the object and its arguments available for the life of the call. `run` binds them at initialization, so keep the same objects and array sizes during performance. Arrange [delete](delete.md) to clean up the objects when the containing instrument ends.

If an object comes from another instrument, both instruments must have the same sample rate, and the caller's `ksmps` must not exceed the object's `ksmps`.

### Arrays of objects

The array form runs objects in index order, starting at 0. Each object has its own state. For opcode arguments that are individual values or audio signals, the following rules apply.

| Argument supplied to `run` | Effect |
| --- | --- |
| One input value or audio signal | Every object receives it. |
| An input array | Object 0 receives element 0, object 1 receives element 1, and so on. |
| An output array | Each element receives the corresponding object's output. |
| One output variable | Each object writes to it in turn. The final value comes from the last object. |

Use one-dimensional arrays and provide an input element for every object. Output arrays grow to the required length at initialization. Input arrays that are too short also grow, but provide the intended values yourself rather than relying on the added elements. For N objects, `run` uses the first N elements of each array.

The element type must match the opcode argument. Numeric and audio arrays can supply separate values for each object. Arrays of strings or user-defined structures are not supported for this use. For an opcode whose own arguments are arrays, use the single-object form of `run` on each object.

Using the same audio variable for a shared input and output makes a chain. Each object reads the result written by the previous object.

An array output keeps the results separate. It does not mix audio automatically. Add the audio elements together when you want a combined signal, as the chord example does.

## Examples

The first instrument plays one oscillator. The second plays a three-note chord from an array of oscillator objects. All three receive the same amplitude, while a frequency array gives each one a different pitch.

The example uses [opcode-object.csd](../examples/opcode-object.csd), also shown in the [object guide](../orch/instrument-and-opcode-objects.md).

``` csound-csd title="Play one oscillator and a bank of three oscillators" linenums="1"
--8<-- "examples/opcode-object.csd"
```

## See also

[create](create.md), [init](init.md), [perf](perf.md), [opcodeinfo](opcodeinfo.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2024.

New in Csound 7.
