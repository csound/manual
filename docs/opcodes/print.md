<!--
id:print
category:Signal I/O:Printing and Display
-->
# print
Displays the values of init (i-rate) variables.

## Syntax
=== "Modern"
    ``` csound-orc
    print(iarg [, iarg1] [, iarg2] [...])
    ```

=== "Classic"
    ``` csound-orc
    print iarg [, iarg1] [, iarg2] [...]
    ```

### Initialization

_iarg, iarg2, ..._ -- i-rate arguments.

### Performance

_print_ -- print the current value of the i-time arguments (or expressions) _iarg_ at every i-pass through the instrument.

> :memo: **Note**
>
> The _print_ opcode will truncate decimal places and may not show the complete value. Csound's precision depends on whether it is the floats (32-bit) or double (64-bit) version, since most internal calculations use one of these formats. If you need more resolution in the console output, you can try [printf](../opcodes/printf.md).

## Examples

Here is an example of the print opcode. It uses the file [print.csd](../examples/print.csd).

``` csound-csd title="Example of the print opcode." linenums="1"
--8<-- "examples/print.csd"
```

Its output should include lines like these:

```
instr 1:  irand = 2.930
instr 1:  irand = 0.420
instr 1:  irand = 2.316
```

## See also

[Printing and Display](../sigio/pdisplay.md)
