<!--
id:cent
category:Pitch Converters:Functions
-->
# cent
Calculates a factor to raise/lower a frequency by a given amount of cents.

## Syntax
``` csound-orc
cent(x)
```

This function works at a-rate, i-rate, and k-rate.

### Initialization

_x_ -- a value expressed in cents.

### Performance

The value returned by the _cent_ function is a factor. You can multiply a frequency by this factor to raise/lower it by the given amount of cents.

## Examples

=== "Modern"
    Here is an example of the cent opcode. It uses the file [cent-modern.csd](../examples/cent-modern.csd).
    ``` csound-csd title="Example of the cent opcode." linenums="1"
    --8<-- "examples/cent-modern.csd"
    ```

=== "Classic"
    Here is an example of the cent opcode. It uses the file [cent.csd](../examples/cent.csd).
    ``` csound-csd title="Example of the cent opcode." linenums="1"
    --8<-- "examples/cent.csd"
    ```

Its output should include lines like:

```
instr 1:  iroot = 440.000

instr 2:  iroot = 440.000
instr 2:  ifactor = 1.189
instr 2:  inew = 523.251

instr 2:  iroot = 440.000
instr 2:  ifactor = 2.000
instr 2:  inew = 880.000
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

New in version 4.16
