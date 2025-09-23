<!--
id:evalstr
category:Instrument Control:Compilation
-->
# evalstr
Evaluates a string containing Csound code, returning a value from the global space (instr 0).

This opcode can be also used to compile new instruments (as _compilestr_).

## Syntax
=== "Modern"
    ``` csound-orc
    ires = evalstr(Scode)
    kres = evalstr(Scode, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    ires evalstr Scode
    kres evalstr Scode, ktrig
    ```

### Initialization

_Scode_ --  a string to be compiled and evaluated.

### Performance

_ktrig_ -- triggers the compilation/evaluation if non-zero.

## Examples

Here is an example of the _evalstr_ opcode in conjunction with _return_:

``` csound-orc
ival evalstr "return 2 + 2"
print ival
```

Here is a complete example of the evalstr opcode. It uses the file [evalstr.csd](../examples/evalstr.csd).

``` csound-csd title="Example of the evalstr opcode." linenums="1"
--8<-- "examples/evalstr.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Victor Lazzarini, 2013
