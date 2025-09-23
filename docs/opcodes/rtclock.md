<!--
id:rtclock
category:Instrument Control:Time Reading
-->
# rtclock
Read the real time clock from the operating system.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = rtclock()
    kres = rtclock()
    ```

=== "Classic"
    ``` csound-orc
    ires rtclock
    kres rtclock
    ```

### Performance

Read the real-time clock from operating system. Under Windows, this changes only once per second. Under GNU/Linux, it ticks every microsecond. Performance under other systems varies.

## Examples

Here is an example of the rtclock opcode. It uses the file [rtclock.csd](../examples/rtclock.csd).

``` csound-csd title="Example of the rtclock opcode." linenums="1"
--8<-- "examples/rtclock.csd"
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: John ffitch

New in version 4.10
