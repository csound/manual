<!--
id:printk
category:Signal I/O:Printing and Display
-->
# printk
Prints one k-rate value at specified intervals.

## Syntax
=== "Modern"
    ``` csound-orc
    printk(itime, kval [, ispace] [, inamed])
    ```

=== "Classic"
    ``` csound-orc
    printk itime, kval [, ispace] [, inamed]
    ```

### Initialization

_itime_ -- time in seconds between printings.

_ispace_ (optional, default=0) -- number of spaces to insert before printing. (default: 0, max: 130)

_inamed_ (optional, default=0) -- if non zero print the name of the _kvar_ as well as the value.

### Performance

_kval_ -- The k-rate values to be printed.

_printk_ prints one k-rate value on every k-cycle, every second or at intervals specified. First the instrument number is printed, then the absolute time in seconds, then a specified number of spaces, then the _kval_ value. The variable number of spaces enables different values to be spaced out across the screen - so they are easier to view.

This opcode can be run on every k-cycle it is run in the instrument. To every accomplish this, set _itime_ to 0.

When _itime_ is not 0, the opcode print on the first k-cycle it is called, and subsequently when every _itime_ period has elapsed. The time cycles start from the time the opcode is initialized - typically the initialization of the instrument.

## Examples

Here is an example of the printk opcode. It uses the file [printk.csd](../examples/printk.csd).

``` csound-csd title="Example of the printk opcode." linenums="1"
--8<-- "examples/printk.csd"
```

Its output should include lines like this:

```
i   1 time     0.00002:     0.00000
i   1 time     1.00002:    20.01084
i   1 time     2.00002:    40.02999
i   1 time     3.00002:    60.04914
i   1 time     4.00002:    79.93327
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

named option new in 6.11

Example written by Kevin Conder.

Thanks goes to Luis Jure for pointing out a mistake with the _itime_ parameter.
