<!--
id:max_k
category:Signal Modifiers:Comparators and Accumulators
-->
# max_k
Local maximum (or minimum) value of an incoming asig signal, checked in the time interval between ktrig has become true twice.

## Syntax
=== "Modern"
    ``` csound-orc
    knumkout = max_k(asig, ktrig, itype)
    ```

=== "Classic"
    ``` csound-orc
    knumkout max_k asig, ktrig, itype
    ```

### Initialization

_itype_ - itype determinates the behaviour of max_k (see below)

### Performance

_asig_ - incoming (input) signal

_ktrig_ - trigger signal

max_k outputs the local maximum (or minimum) value of  the incoming _asig_ signal, checked in the time interval between _ktrig_ has become true twice. _itype_ determinates the behaviour of max_k:

1 - absolute maximum (sign of negative values is changed to positive before evaluation).

2 - actual maximum.

3 - actual minimum.

4 - calculate average value of _asig_ in the time interval since the last trigger.

This opcode can be useful in several situations, for example to implement a vu-meter.

## Examples

Here is an example of the max_k opcode. It uses the file [max_k.csd](../examples/max_k.csd).

``` csound-csd title="Example of the max_k opcode." linenums="1"
--8<-- "examples/max_k.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on
CsoundAV)

Fixed to agree with documentation in 5.15
