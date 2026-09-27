<!--
id:eventcycles
category:Instrument Control:Time Reading
-->
# eventcycles
Read absolute time in k-rate cycles, since the start of an instance of an instrument.

Called at both i-time and k-time. At k-time, the first performance cycle returns 0.
A note that runs for N cycles reports cycle indices from 0 through N - 1.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = eventcycles()
    ```

=== "Classic"
    ``` csound-orc
    kres eventcycles
    ```

### Performance

_eventcycles_ is for time in k-rate cycles. So with:

``` csound-orc
sr    = 44100
ksmps = 7
```

then after half a second, the _eventcycles_ opcode would report 3150. It will always report an integer.

_eventcycles_ produces a k-rate variable for output. There are no input parameters.

_eventcycles_ is similar to [elapsedcycles](../opcodes/elapsedcycles.md) except it returns the time since the start of this instance of the instrument.

> :memo: **Note**
>
> _eventcycles_ starts at 0 on the first performance cycle, while [timeinstk](../opcodes/timeinstk.md) starts at 1.

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Eduardo Moguillansky<br>
August 2022<br>
