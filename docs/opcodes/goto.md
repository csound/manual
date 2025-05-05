<!--
id:goto
category:Instrument Control:Program Flow Control
-->
# goto
Transfer control to _label_ on every pass. (Combination of [igoto](../opcodes/igoto.md) and [kgoto](../opcodes/kgoto.md))

## Syntax
=== "Modern"
    ``` csound-orc
    goto(label)
    ```

=== "Classic"
    ``` csound-orc
    goto label
    ```

where _label_ is in the same instrument block and is not an expression.

> :memo: **Note**
>
> Using _goto_ not as part of an [if](../opcodes/if.md) statement (as in: goto end), will cause initialization to be skipped on all the code the _goto_ jumps over. In performance, leaving some opcodes uninitialized will cause deletion of the note/event. In these cases, using [kgoto](../opcodes/kgoto.md) (as in: kgoto end) might be preferred.

## Examples

=== "Modern"
    Here is an example of the goto opcode. It uses the file [goto-modern.csd](../examples/goto-modern.csd).
    ``` csound-csd title="Example of the goto opcode." linenums="1"
    --8<-- "examples/goto-modern.csd"
    ```

=== "Classic"
    Here is an example of the goto opcode. It uses the file [goto.csd](../examples/goto.csd).
    ``` csound-csd title="Example of the goto opcode." linenums="1"
    --8<-- "examples/goto.csd"
    ```

## See also

[Program Flow Control](../control/pgmctl.md)

## Credits

Example written by Kevin Conder.

Added a note by Jim Aikin.
