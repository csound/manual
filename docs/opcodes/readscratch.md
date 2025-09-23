<!--
id:readscratch
category:Instrument Control:Sensing and Control
-->
# readscratch
Returns one of four scalar values stored in the instance of an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = readscratch([index])
    ```

=== "Classic"
    ``` csound-orc
    ival readscratch [index]
    ```

Initialisation

_ival_ --  variable for result.

_index_ --  which value to read, defaulting to zero.

## Examples

Here is an example of the readscratch opcode. It uses the file [readscratch.csd](../examples/readscratch.csd).

``` csound-csd title="Example of the readscratch opcode." linenums="1"
--8<-- "examples/readscratch.csd"
```

## See Also

[writescratch](../opcodes/writescratch.md).

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: John ffitch<br>
March 2013<br>

New in Csound version 6.00
