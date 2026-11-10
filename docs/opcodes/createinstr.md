<!--
id:createinstr
category:Instrument Control:Initialization and Reinitialization
-->
# createinstr
Compiles an instrument body into an instrument definition.

`createinstr` is another name for the string-input form of [create](create.md). It returns an `InstrDef`.

Each call creates a new definition in a free instrument-number slot, even when you assign the result to the same variable. To replace an existing instrument, use [compilestr](compilestr.md). See [Instrument definition numbers](create.md#instrument-definition-numbers) for details.

## Syntax

=== "Modern"
    ``` csound-orc
    definition:InstrDef = createinstr(Scode)
    ```

=== "Classic"
    ``` csound-orc
    definition:InstrDef createinstr Scode
    ```

See [create](create.md) for the arguments, examples and credits.

New in Csound 7.
