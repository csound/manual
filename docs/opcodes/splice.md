<!--
id:splice
category:Instrument Control:Initialization and Reinitialization
-->

# splice
Splices the performance list and modifies the position of an instrument in the list order at i-time.

## Syntax
=== "Modern"
    ``` csound-orc
    err:i = splice(inst1:Instr,inst2:Instr,mode:i) 
    ```

=== "Classic"
    ``` csound-orc
    err:i splice inst1:Instr,inst2:Instr,mode:i
    ```

### Initialization

_var_ -- error code (0 = no error).

_inst1_ -- instance to be acted on.

_inst2_ -- reference instance

_mode_ -- 0 to place the instance before the reference, 1 to place it after.

The first instance is placed in the performance list immediately
after or before the second instance (used as a reference)


## Examples

Here is an example of the splice opcode. It uses the file [create.csd](../examples/splice.csd).

``` csound-csd title="Examples of the splice opcode." linenums="1"
--8<-- "examples/splice.csd"
```

## Credits


Author: Victor Lazzarini<br>
Maynooth University<br>
Ireland<br>
Csound 7, 2024<br>
