<!--
id:createinstr
category:Instrument Control:Initialization and Reinitialization
-->
# createinstr
Compiles an instrument body into an instrument definition.

`createinstr` is another name for the string-input form of [create](create.md). It returns an `InstrDef`.

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
