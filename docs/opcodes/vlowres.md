<!--
id:vlowres
category:Signal Modifiers:Standard Filters:Resonant
-->
# vlowres
A bank of filters in which the cutoff frequency can be separated under user control.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vlowres(asig, kfco, kres, iord, ksep)
    ```

=== "Classic"
    ``` csound-orc
    ares vlowres asig, kfco, kres, iord, ksep
    ```

### Initialization

_iord_ -- total number of filters (1 to 10)

### Performance

_asig_ -- input signal

_kfco_ -- positive cutoff control for the first filter, not in Hz.

_kres_ -- positive resonance control shared by all filters, not in dB.

_ksep_ -- cutoff separation. Filter _j_, counting from zero, uses cutoff `kfco * (1 + ksep*j/iord)`. For example, with _kfco_ = 100, _iord_ = 4, and _ksep_ = 1, the cutoffs are 100, 125, 150, and 175. A separation of zero gives every filter the same cutoff. Choose _ksep_ so that every cutoff stays positive.

_vlowres_ connects several [lowres](../opcodes/lowres.md) filters in series. All filters share the same resonance, while _kfco_ and _ksep_ set their cutoffs.

## Examples

Here is an example of the vlowres opcode. It uses the file [vlowres.csd](../examples/vlowres.csd).

``` csound-csd title="Example of the vlowres opcode." linenums="1"
--8<-- "examples/vlowres.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.49
