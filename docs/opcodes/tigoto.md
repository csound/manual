<!--
id:tigoto
category:Instrument Control:Program Flow Control
-->
# tigoto
Transfer control at i-time when a new note is being tied onto a previously held note.

Similar to [igoto](../opcodes/igoto.md) but effective only during an i-time pass at which a new note is being &#8220;tied&#8221; onto a previously held note. (See [i Statement](../scoregens/i.md)) It does not work when a tie has not taken place. Allows an instrument to skip initialization of units according to whether a proposed tie was in fact successful. (See also [tival](../opcodes/tival.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    tigoto(label)
    ```

=== "Classic"
    ``` csound-orc
    tigoto label
    ```

where _label_ is in the same instrument block and is not an expression.

## Examples

Here is an example of the tigoto opcode. It uses the file [tigoto.csd](../examples/tigoto.csd).

``` csound-csd title="Example of the tigoto opcode." linenums="1"
--8<-- "examples/tigoto.csd"
```

Here is another example of the tigoto opcode. It uses the file [tigoto2.csd](../examples/tigoto2.csd).

``` csound-csd title="Second example of the tigoto opcode." linenums="1"
--8<-- "examples/tigoto2.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)
