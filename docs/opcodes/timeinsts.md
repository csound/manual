<!--
id:timeinsts
category:Instrument Control:Time Reading
-->
# timeinsts
Read absolute time, in seconds, since the start of an instance of an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = timeinsts()
    ```

=== "Classic"
    ``` csound-orc
    kres timeinsts
    ```

### Performance

Time in seconds is available with _timeinsts_. This would return 0.5 after half a second.

_timeinsts_ produces a k-rate variable for output. There are no input parameters.

_timeinsts_ is similar to [times](../opcodes/times.md) except it returns the time since the start of this instance of the instrument.

## Examples

Here is an example of the timeinsts opcode. It uses the file [timeinsts.csd](../examples/timeinsts.csd).

``` csound-csd title="Example of the timeinsts opcode." linenums="1"
--8<-- "examples/timeinsts.csd"
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
