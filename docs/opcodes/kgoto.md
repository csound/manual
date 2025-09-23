<!--
id:kgoto
category:Instrument Control:Program Flow Control
-->
# kgoto
During the p-time passes only, unconditionally transfer control to the statement labeled by _label_.

## Syntax
=== "Modern"
    ``` csound-orc
    kgoto(label)
    ```

=== "Classic"
    ``` csound-orc
    kgoto label
    ```

where _label_ is in the same instrument block and is not an expression.

## Examples

Here is an example of the kgoto opcode. It uses the file [kgoto.csd](../examples/kgoto.csd).

``` csound-csd title="Example of the kgoto opcode." linenums="1"
--8<-- "examples/kgoto.csd"
```

Its output should include lines like this:

```
kval = 0.000000, kfreq = 440.000000
kval = 0.999732, kfreq = 440.000000
kval = 1.999639, kfreq = 880.000000
```

## See also

[Program Flow Control](../control/pgmctl.md)

## Credits

Example written by Kevin Conder.
