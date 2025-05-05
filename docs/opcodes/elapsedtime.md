<!--
id:elapsedtime
category:Instrument Control:Time Reading
-->
# elapsedtime
Read absolute time, in seconds, since the start of the performance.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = elapsedtime()
    kres = elapsedtime()
    ```

=== "Classic"
    ``` csound-orc
    ires elapsedtime
    kres elapsedtime
    ```

### Performance

Time in seconds is available with _elapsedtime_. This would return 0.5 after half a second.

_elapsedtime_ can both produce a k-rate variable for output. There are no input parameters.

_elapsedtime_ can also operate at the start of the instance of the instrument. It produces an i-rate variable (starting with _i_ or _gi_) as its output.

> :memo: **Note**
>
> _elapsedtime_ acts like [times](../opcodes/times.md) but it returns the correct values instead of being one cycle late.

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Eduardo Moguillansky<br>
August 2022<br>
