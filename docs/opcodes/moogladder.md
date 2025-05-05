<!--
id:moogladder
category:Signal Modifiers:Standard Filters:Resonant
-->
# moogladder
Moog ladder lowpass filter.

Moogladder is an new digital implementation of the Moog ladder filter based on the work of Antti Huovilainen, described in the paper "Non-Linear Digital Implementation of the Moog Ladder Filter" (Proceedings of DaFX04, Univ of Napoli). This implementation is probably a more accurate digital representation of the original analogue filter.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = moogladder(ain, kcf, kres[, istor])
    asig = moogladder(ain, acf, kres[, istor])
    asig = moogladder(ain, kcf, ares[, istor])
    asig = moogladder(ain, acf, ares[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig moogladder ain, kcf, kres[, istor]
    asig moogladder ain, acf, kres[, istor]
    asig moogladder ain, kcf, ares[, istor]
    asig moogladder ain, acf, ares[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is
significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal.

_kcf_/_acf_ -- filter cutoff frequency

_kres_/_ares_ -- resonance, generally &lt; 1, but not limited to it.  Higher than 1 resonance values might cause aliasing, analogue synths generally allow resonances to be above 1.

## Examples

Here is an example of the moogladder opcode. It uses the file [moogladder.csd](../examples/moogladder.csd).

``` csound-csd title="Example of the moogladder opcode." linenums="1"
--8<-- "examples/moogladder.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

January 2005.

Audio rate parameters introduced in version 6.02

October 2013.
