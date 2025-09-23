<!--
id:loopsegp
category:Signal Generators:Linear and Exponential Generators
-->
# loopsegp
Control signals based on linear segments.

Generate control signal consisiting of linear segments delimited by two or more specified points. The entire envelope can be looped at time-variant rate. Each segment coordinate can also be varied at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ksig = loopsegp(kphase, kvalue0, kdur0, kvalue1 \
                    [, kdur1, ... , kdurN-1, kvalueN])
    ```

=== "Classic"
    ``` csound-orc
    ksig loopsegp kphase, kvalue0, kdur0, kvalue1 \
                  [, kdur1, ... , kdurN-1, kvalueN]
    ```

### Performance

_ksig_ - output signal

_kphase_ - point of the sequence read, expressed as a fraction of a cycle (0 to 1)

_kvalue0_ ..._kvalueN_  - values of points

_kdur0_ ..._kdurN-1_  -  duration of points expessed in fraction of a cycle

_loopsegp_ opcode is similar to [loopseg](../opcodes/loopseg.md); the only difference is that, instead of frequency,  a time-variant phase is required. If you use [phasor](../opcodes/phasor.md) to get the phase value, you will have a behaviour identical to [loopseg](../opcodes/loopseg.md), but interesting results can be achieved when using phases having non-linear motions, making _loopsegp_ more  powerful and general than [loopseg](../opcodes/loopseg.md).

## Examples

Here is an example of the loopsegp opcode. It uses the file [loopsegp.csd](../examples/loopsegp.csd).

``` csound-orc title="Example of the loopsegp opcode." linenums="1"
--8<-- "examples/loopsegp.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5. (Previously available only on CsoundAV)
