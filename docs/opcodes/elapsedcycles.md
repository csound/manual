<!--
id:elapsedcycles
category:Instrument Control:Time Reading
-->
# elapsedcycles
Read absolute time, in k-rate cycles, since the start of the performance.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = elapsedcycles()
    kres = elapsedcycles()
    ```

=== "Classic"
    ``` csound-orc
    ires elapsedcycles
    kres elapsedcycles
    ```

### Performance

_elapsedcycles_ is for time in k-rate cycles. So with:

``` csound-orc
 sr    = 44100
 kr    = 6300
 ksmps = 7
```

then after half a second, the _elapsedcycles_ opcode would report 3150. It will always report an integer.

_elapsedcycles_ can produce a k-rate variable for output. There are no input parameters.

_elapsedcycles_ can also operate only at the start of the instance of the instrument. It produces an i-rate variable (starting with _i_ or _gi_) as its output.

> :memo: **Note**
>
> _elapsedcycles_ acts like [timek](../opcodes/timek.md) but it returns the correct values instead of being one cycle late.

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Eduardo Moguillansky<br>
August 2022<br>
