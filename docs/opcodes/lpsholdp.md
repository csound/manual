<!--
id:lpsholdp
category:Signal Generators:Linear and Exponential Generators
-->
# lpsholdp
Control signals based on held segments.

The segments are delimited by two or more specified points. The entire envelope can be looped at time-variant rate. Each segment coordinate can also be varied at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ksig = lpsholdp(kphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \
                    [, kvalue2] [, ktime2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ksig lpsholdp kphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \
                  [, kvalue2] [, ktime2] [...]
    ```

### Performance

_ksig_ - output signal

_kphase_ -- point of the sequence read, expressed as a fraction of a cycle (0 to 1)

_kvalue0...kvalueN_ -- Values of points

_ktime0...ktimeN_ -- Times between points; expressed in fractions of a cycle (see below). The final time designates a ramp between the final value and the first value.

_lpsholdp_ opcode is similar to [lpshold](../opcodes/lpshold.md); the only difference is that, instead of frequency,  a time-variant phase is required. If you use a phasor to get the phase value, you will have a behaviour identical to _lpshold_, but interesting results can be achieved when using phases having non-linear motions, making _lpsholdp_ more powerful and general than _lpshold_.

## Examples

Here is an example of the lpsholdp opcode. It uses the file [lpsholdp.csd](../examples/lpsholdp.csd).

``` csound-orc title="Example of the lpsholdp opcode." linenums="1"
--8<-- "examples/lpsholdp.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
