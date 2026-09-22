<!--
id:start
category:Instrument Control:Initialization and Reinitialization
-->
# start
Prepares an embedded Csound engine for performance.

Use `start` after configuring and compiling a `Csound` object. The containing instrument then controls its performance with `perf(engine)`.

## Syntax

=== "Modern"
    ``` csound-orc
    iresult = start(engine)
    ```

=== "Classic"
    ``` csound-orc
    iresult start engine
    ```

### Initialization

`engine` is a `Csound` object made with `engine:Csound = create()`.

`iresult` is 0 on success and nonzero on failure. Check it before calling `perf` or reading the engine's audio. The return value lets the containing instrument decide how to handle a failed start.

`start` runs at initialization. It prepares the engine's audio I/O according to its options and allocates the buffers used to pass audio between the two engines. Call it once per engine. Calling it again on an engine that has already started returns an error and does not restart performance.

The usual setup order is to create the engine, apply [setoption](setoption.md), compile its orchestra with `compilestr(engine, Scode)` or its CSD file with `compilecsd(engine, Sfile)`, then call `start(engine)`.

Set options before compilation and startup. For an embedded engine whose audio the containing instrument will play, `setoption(engine, "-n")` prevents a separate sound output file. Audio remains available to the containing instrument.

An engine can also start before a CSD is compiled. In that case, the later CSD's `CsOptions` section is ignored and its score is sent as real-time events. Compile the CSD first when you want its options and normal score preprocessing.

### Performance

`start` does not run the engine continuously in the background. Call `kstatus = perf(engine)` on each control cycle where you want it to advance. After that call, `aSignal = inch(engine, 1)` reads the first output channel. Audio channel numbers start at 1.

Use matching sample rates for audio exchange. The example also uses the same `ksmps` in both engines.

Keep the engine alive while performing it or reading its output. Arrange [delete](delete.md) to release it when the containing instrument ends. [destroy](destroy.md) releases it immediately at initialization and must not precede later performance calls on that engine.

## Examples

A composition can prepare an embedded synthesizer before it needs to play. This example starts the engine at initialization, waits half a second in the containing instrument, then calls `perf` to play a one-second tone. The wait does not consume the embedded note's duration.

It uses [start.csd](../examples/start.csd).

``` csound-csd title="Prepare an engine before performing its first note" linenums="1"
--8<-- "examples/start.csd"
```

## See also

[setoption](setoption.md), [compilestr](compilestr.md), [compilecsd](compilecsd.md), [perf](perf.md), [inch](inch.md), [delete](delete.md), [destroy](destroy.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
