<!--
id:destroy
category:Instrument Control:Initialization and Reinitialization
-->
# destroy
Destroys an embedded Csound engine at initialization.

Use `destroy` when you have finished with a temporary `Csound` object and want to release it during initialization, before the containing instrument ends.

## Syntax

=== "Modern"
    ``` csound-orc
    destroy(engine)
    ```

=== "Classic"
    ``` csound-orc
    destroy engine
    ```

### Initialization

`engine` is a `Csound` object made with `engine:Csound = create()`. It holds a separate Csound engine inside the running one.

`destroy` has no output. It destroys that engine and frees any audio buffers allocated for it. The containing Csound engine keeps running.

For a `Csound` object, [delete](delete.md) performs the same cleanup when the containing instrument ends, including any release extension. `destroy` performs it when execution reaches the call during initialization. It has no performance-time form.

Destroy each engine only once. Do not also call `delete` for it, and stop using every reference to it after destruction. Copying a `Csound` object variable shares the engine rather than creating another one.

`destroy` accepts only a `Csound` object. See [delete](delete.md) for cleanup of `Instr`, `InstrDef` and `Opcode` objects.

## Examples

You can check whether a generated instrument definition compiles in a temporary engine without adding it to the main orchestra. This example destroys the temporary engine as soon as compilation returns, then reports the saved result. It does not start or perform the temporary engine.

It uses [destroy.csd](../examples/destroy.csd).

``` csound-csd title="Discard an engine after checking an instrument definition" linenums="1"
--8<-- "examples/destroy.csd"
```

## See also

[delete](delete.md), [compilestr](compilestr.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
