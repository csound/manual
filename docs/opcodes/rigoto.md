<!--
id:rigoto
category:Instrument Control:Initialization and Reinitialization
-->
# rigoto
Transfers control during a reinit pass.

Similar to [igoto](../opcodes/igoto.md), but effective only during a [reinit](../opcodes/reinit.md) pass (i.e., no-op at standard i-time). This statement is useful for bypassing units that are not to be reinitialized.

## Syntax
=== "Modern"
    ``` csound-orc
    rigoto(label)
    ```

=== "Classic"
    ``` csound-orc
    rigoto label
    ```

## See also

[Initialization and Reinitialization](../control/reinitn.md)
