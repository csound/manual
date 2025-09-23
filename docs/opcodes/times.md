<!--
id:times
category:Instrument Control:Time Reading
-->
# times
Read absolute time, in seconds, since the start of the performance.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = times()
    kres = times()
    ```

=== "Classic"
    ``` csound-orc
    ires times
    kres times
    ```

### Performance

Time in seconds is available with _times_. This would return 0.5 after half a second.

_times_ can both produce a k-rate variable for output. There are no input parameters.

_times_ can also operate at the start of the instance of the instrument. It produces an i-rate variable (starting with _i_ or _gi_) as its output.

## Examples

Here is an example of the times opcode. It uses the file [times_complex.csd](../examples/times_complex.csd).

``` csound-csd title="Example of the times opcode." linenums="1"
--8<-- "examples/times_complex.csd"
```

Its output should include lines like these:

```
new alloc for instr again:
instance = 1, start = 0.000000, duration = 0.650439
new alloc for instr fx_processor:
instance = 2, start = 0.650884, duration = 0.411043
new alloc for instr fx_processor:
instance = 3, start = 1.061587, duration = 0.231085
new alloc for instr fx_processor:
instance = 4, start = 1.292336, duration = 0.543473
new alloc for instr fx_processor:
instance = 5, start = 1.835828, duration = 1.777097
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
