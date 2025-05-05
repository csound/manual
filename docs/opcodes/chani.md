<!--
id:chani
category:Signal I/O:Software Bus
-->
# chani
Reads data from a channel of the inward software bus.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = chani(kchan)
    aval = chani(kchan)
    ```

=== "Classic"
    ``` csound-orc
    kval chani kchan
    aval chani kchan
    ```

### Performance

_kchan_ -- a positive integer that indicates which channel of the software bus to read

Note that the inward and outward software busses are independent, and are not mixer buses.  Also the k-rate and a-rate busses are independent.  The last value remains until a new value is written.  There is no imposed limit to the number of busses but they use memory so small numbers are to be preferred.

## Examples

The example shows the software bus being used as an asynchronous control signal to select a filter cutoff.  It assumes that an external program that has access to the API is feeding the values

``` csound-orc linenums="1"
sr = 44100
kr = 100
ksmps = 1

instr   1
    kc   chani     1
    a1   oscil     p4, p5, 100
    a2   lowpass2  a1, kc, 200
         out       a2
endin
```

## See also

[Software Bus](../sigio/softbus.md)

## Credits

Author: John ffitch<br>
2005<br>

New in Csound 5.00
