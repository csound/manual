<!--
id:timeinstk
category:Instrument Control:Time Reading
-->
# timeinstk
Read absolute time in k-rate cycles, since the start of aninstance of an instrument.

Called at both i-time as well as k-time. NB: the returned value at k-time starts at 1

## Syntax
=== "Modern"
    ``` csound-orc
    kres = timeinstk()
    ```

=== "Classic"
    ``` csound-orc
    kres timeinstk
    ```

### Performance

_timeinstk_ is for time in k-rate cycles. So with:

``` csound-orc
  sr    = 44100
  kr    = 6300
  ksmps = 7
```

then after half a second, the _timeinstk_ opcode would report 3150. It will always report an integer.

_timeinstk_ produces a k-rate variable for output. There are no input parameters.

_timeinstk_ is similar to [timek](../opcodes/timek.md) except it returns the time since the start of this instance of the instrument.

## Examples

Here is an example of the timeinstk opcode. It uses the file [timeinstk.csd](../examples/timeinstk.csd).

``` csound-csd title="Example of the timeinstk opcode." linenums="1"
--8<-- "examples/timeinstk.csd"
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

Example written by Kevin Conder.
