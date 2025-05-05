<!--
id:eventtime
category:Instrument Control:Time Reading
-->
# eventtime
Read absolute time, in seconds, since the start of an instance of an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = eventtime()
    ```

=== "Classic"
    ``` csound-orc
    kres eventtime
    ```

### Performance

Time in seconds is available with _eventtime_. This would return 0.5 after half a second.

_eventtime_ produces a k-rate variable for output. There are no input parameters.

_eventtime_ is similar to [elapsedtime](../opcodes/elapsedtime.md) except it returns the time since the start of this instance of the instrument.

> :memo: **Note**
>
> _eventtime_ acts like [timeinsts](../opcodes/timeinsts.md) but it returns the correct values instead of being one cycle late.

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Eduardo Moguillansky<br>
August 2022<br>
