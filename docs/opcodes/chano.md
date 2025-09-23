<!--
id:chano
category:Signal I/O:Software Bus
-->
# chano
Send data to a channel of the outward software bus.

## Syntax
=== "Modern"
    ``` csound-orc
    chano(kval, kchan)
    chano(aval, kchan)
    ```

=== "Classic"
    ``` csound-orc
    chano kval, kchan
    chano aval, kchan
    ```

### Performance

_xval_ --- value to transmit

_kchan_ -- a positive integer that indicates which channel of the software bus to write

Note that the inward and outward software busses are independent, and are not mixer buses.  Also the k-rate and a-rate busses are independent.  The last value remains until a new value is written.  There is no imposed limit to the number of busses but they use memory so small numbers are to be preferred.

## Examples

The example shows the software bus being used as an output audio channel. It assumes that an external program that has access to the API is receiving the values.

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

instr   1
    a1   oscil     p4, p5, 100
         chano     1, a1
endin
```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: John ffitch<br>
2005<br>

New in Csound 5.00
