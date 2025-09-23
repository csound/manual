<!--
id:printk2
category:Signal I/O:Printing and Display
-->
# printk2
Prints a new value every time a control variable changes.

## Syntax
=== "Modern"
    ``` csound-orc
    printk2(kvar [, inumspaces] [, inamed])
    ```

=== "Classic"
    ``` csound-orc
    printk2 kvar [, inumspaces] [, inamed]
    ```

### Initialization

_inumspaces_ (optional, default=0) -- number of space characters printed before the value of _kvar_.

_inamed_ (optional, default=0) -- if non zero print the name of the _kvar_ as well as the value.

### Performance

_kvar_ -- signal to be printed

Derived from Robin Whittle's _printk_, prints a new value of _kvar_ each time _kvar_ changes. Useful for monitoring MIDI control changes when using sliders.

> :warning: **Warning**
>
> _WARNING!_ Do not use this opcode with normal, continuously variant k-signals, because it can hang the computer, as the rate of printing is too fast.

## Examples

Here is an example of the printk2 opcode. It uses the file [printk2.csd](../examples/printk2.csd).

``` csound-csd title="Example of the printk2 opcode." linenums="1"
--8<-- "examples/printk2.csd"
```

Its output should include lines like these:

```
i1     0.00000
i1     3.00000
i1     1.00000
i1     3.00000
i1     1.00000
i1     2.00000
i1     3.00000
.....
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.48

named option new in 6.11
