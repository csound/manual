<!--
id:ckgoto
category:Instrument Control:Program Flow Control
-->
# ckgoto
During the p-time passes only, conditionally transfer control to the statement labeled by _label_.

## Syntax
=== "Modern"
    ``` csound-orc
    ckgoto(condition, label)
    ```

=== "Classic"
    ``` csound-orc
    ckgoto condition, label
    ```

where _label_ is in the same instrument block and is not an expression, and where _condition_ uses one of the Relational operators (_&lt;_,_ =_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../control/conditional.md)).

## Examples

=== "Modern"
    Here is an example of the ckgoto opcode. It uses the file [ckgoto-modern.csd](../examples/ckgoto-modern.csd).
    ``` csound-csd title="Example of the ckgoto opcode." linenums="1"
    --8<-- "examples/ckgoto-modern.csd"
    ```

=== "Classic"
    Here is an example of the ckgoto opcode. It uses the file [ckgoto.csd](../examples/ckgoto.csd).
    ``` csound-csd title="Example of the ckgoto opcode." linenums="1"
    --8<-- "examples/ckgoto.csd"
    ```

Its output should include lines like:

```
kval = 0.000000, kfreq = 440.000000
kval = 0.999732, kfreq = 440.000000
kval = 1.999639, kfreq = 880.000000
```

## See also

[Program Flow Control](../control/pgmctl.md)

## Credits

Example written by Kevin Conder.
