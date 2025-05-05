<!--
id:timek
category:Instrument Control:Time Reading
-->
# timek
Read absolute time, in k-rate cycles, since the start of the performance.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = timek()
    kres = timek()
    ```

=== "Classic"
    ``` csound-orc
    ires timek
    kres timek
    ```

### Performance

_timek_ is for time in k-rate cycles. So with:

``` csound-orc
  sr    = 44100
  kr    = 6300
  ksmps = 7
```

then after half a second, the _timek_ opcode would report 3150. It will always report an integer.

_timek_ can produce a k-rate variable for output. There are no input parameters.

_timek_ can also operate only at the start of the instance of the instrument. It produces an i-rate variable (starting with _i_ or _gi_) as its output.

## Examples

Here is an example of the timek opcode. It uses the file [timek.csd](../examples/timek.csd).

``` csound-csd title="Example of the timek opcode." linenums="1"
--8<-- "examples/timek.csd"
```

Its output should include lines like this:

```
k1 = 1.000000 samples
k1 = 2205.000000 samples
k1 = 4410.000000 samples
k1 = 6615.000000 samples
k1 = 8820.000000 samples
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47

Example written by Kevin Conder.
