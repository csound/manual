<!--
id:return
category:Instrument Control:Compilation
-->
# return
Returns a value from an instrument at i-time.

The value of a global instrument (instrument 0) can be retrieved after compilation by the evalstr opcode. The retrieval of values returned by other instruments is not yet implemented.

## Syntax
=== "Modern"
    ``` csound-orc
    return(ival)
    ```

=== "Classic"
    ``` csound-orc
    return ival
    ```

### Initialization

_ival_ --  a value to be returned by instrument.

## Examples

Here is an example of the _return_ opcode in conjunction with _evalstr_:

``` csound-orc
ival evalstr "return 2 + 2"
print ival
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Victor Lazzarini, 2013
