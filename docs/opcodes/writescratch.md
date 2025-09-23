<!--
id:writescratch
category:Instrument Control:Sensing and Control
-->
# writescratch
Writes one of four scalar values into the scratchpad of the instance of an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    writescratch(ival [index])
    ```

=== "Classic"
    ``` csound-orc
    writescratch ival [index]
    ```

Initialisation

_ival_ --  variable to write.

_index_ --  which value to write, defaulting to zero.

## Examples

Here is an example of the writescratch opcode. It uses the file [readscratch.csd](../examples/readscratch.csd).

``` csound-csd title="Example of the writescratch opcode." linenums="1"
--8<-- "examples/readscratch.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: John ffitch<br>
March 2013<br>

New in Csound version 6.00
