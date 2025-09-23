<!--
id:puts
category:Strings:Manipulation
-->
# puts
Print a string with an optional newline at the end whenever the trigger signal is positive and changes.

## Syntax
=== "Modern"
    ``` csound-orc
    puts(Sstr, ktrig [, inonl])
    ```

=== "Classic"
    ``` csound-orc
    puts Sstr, ktrig [, inonl]
    ```

### Initialization

_Sstr_ -- string to be printed

_inonl_ (optional, defaults to 0) -- if non-zero, disables the default printing of a newline character at the end of the string

### Performance

_ktrig_ -- trigger signal, should be valid at i-time. The string is printed at initialization time if ktrig is positive, and at performance time whenever ktrig is both positive and different from the previous value. Use a constant value of 1 to print once at note initialization.

## Examples

Here is an example of the puts opcode. It uses the file [puts.csd](../examples/puts.csd).

``` csound-csd title="Example of the puts opcode." linenums="1"
--8<-- "examples/puts.csd"
```

Its output should include lines like these:

```
frequency in Hertz : 440
frequency in Hertz : 441
frequency in Hertz : 442
....
frequency in Hertz : 459
frequency in Hertz : 460
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
