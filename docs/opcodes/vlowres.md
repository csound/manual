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

_kfco_ -- frequency cutoff (not in Hz)

_kres_ -- resonance amount

_ksep_ -- frequency cutoff separation for each filter: the first filter has a kfreq cutoff, the second has a kfreq + ksep and the third  kfreq + 2*ksep and so on, depending on the number of filters.

_vlowres_ (variable resonant lowpass filter) allows a variable response curve in resonant filters. It can be thought of as a bank of lowpass resonant filters, each with the same resonance, serially connected. The frequency cutoff of each filter can vary with the _kcfo_ and _ksep_ parameters.

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
