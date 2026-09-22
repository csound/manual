<!--
id:setoption
category:Instrument Control:Initialization and Reinitialization
-->
# setoption
Sets command-line options on an embedded Csound engine.

Use `setoption` to configure a `Csound` object before compiling code or starting it. It sets options for the supplied engine and does not replace the containing CSD's `CsOptions` section.

## Syntax

=== "Modern"
    ``` csound-orc
    iresult = setoption(engine, Soptions)
    ```

=== "Classic"
    ``` csound-orc
    iresult setoption engine, Soptions
    ```

### Initialization

`engine` is a `Csound` object made with `engine:Csound = create()`.

`Soptions` contains one or more [Csound command-line options](../invoke/cs-options-by-category.md), separated by spaces. For example, `"-n -d -m0"` disables the engine's sound output, disables displays and reduces its messages. Supply the options themselves, without the `csound` command name.

`iresult` is 0 when the option parser reports success and nonzero when it reports an error or the engine has already started. Check it before continuing. Some unknown long options produce a warning and are ignored while the result remains 0, so also check option messages. A zero result does not guarantee that every option was recognized or that later compilation and startup will succeed.

Call `setoption` after `create` and before `compilestr`, `compilecsd` or `start` on that engine. You can make several calls during setup. Once the engine has started, `setoption` returns 1 without applying the new options.

The opcode runs at initialization. Changing the string during performance does not update the engine's options.

## Examples

An embedded engine can generate audio for the main engine to mix or process. In this example, `-n` stops the embedded engine from writing its own sound file. Its audio remains available through `inch`, and the main engine sends that audio to its output.

The options apply before compilation and startup. The example checks each return value and uses [delete](delete.md) to release the embedded engine when the containing instrument ends.

It uses [setoption.csd](../examples/setoption.csd).

``` csound-csd title="Configure an embedded engine for audio processing" linenums="1"
--8<-- "examples/setoption.csd"
```

## See also

[Csound options](../invoke/cs-options-by-category.md), [compilestr](compilestr.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
