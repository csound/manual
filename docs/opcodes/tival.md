<!--
id:tival
category:Instrument Control:Initialization and Reinitialization
-->
# tival
Puts the value of the instrument's internal &#8220;tie-in&#8221; flag into the named i-rate variable.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = tival()
    ```

=== "Classic"
    ``` csound-orc
    ir tival
    ```

### Initialization

Puts the value of the instrument's internal &#8220;tie-in&#8221; flag into the named i-rate variable. Assigns 1 if this note has been &#8220;tied&#8221; onto a previously held note (see [i statement](../scoregens/i.md)); assigns 0 if no tie actually took place. (See also [tigoto](../opcodes/tigoto.md).)

## Examples

Here is an example of the tival opcode. It uses the file [tival.csd](../examples/tival.csd).

``` csound-csd title="Example of the tival opcode." linenums="1"
--8<-- "examples/tival.csd"
```

A musical examples featuring the tival opcode: [TivalNstrnum_Yi.csd](../examples/musical/TivalNstrnum_Yi.csd) by Steven Yi.

## See also

[Initialization and Reinitialization](../control/reinitn.md)

More on this opcode: [http://www.csoundjournal.com/2005fall/tiedNotes.html](http://www.csoundjournal.com/2005fall/tiedNotes.html), written by Steven Yi
