<!--
id:wguide1
category:Signal Modifiers:Waveguides
-->
# wguide1
A simple waveguide model consisting of one delay-line and one first-order lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wguide1(asig, xfreq, kcutoff, kfeedback)
    ```

=== "Classic"
    ``` csound-orc
    ares wguide1 asig, xfreq, kcutoff, kfeedback
    ```

### Performance

_asig_ -- the input of excitation noise.

_xfreq_ -- the frequency (i.e. the inverse of delay time) Changed to x-rate in Csound version 3.59.

_kcutoff_ -- the filter cutoff frequency in Hz.

_kfeedback_ -- the feedback factor.

_wguide1_ is the most elemental waveguide model, consisting of one delay-line and one first-order lowpass filter.

Implementing waveguide algorithms as opcodes, instead of orc instruments, allows the user to set _kr_ different than _sr_, allowing better performance particulary when using real-time.

<figure markdown="span">
![wguide1.](../images/wguide1.png)
<figcaption>wguide1.</figcaption>
</figure>

## Examples

Here is an example of the wguide1 opcode. It uses the file [wguide1.csd](../examples/wguide1.csd).

``` csound-csd title="Example of the wguide1 opcode." linenums="1"
--8<-- "examples/wguide1.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

[Waveguides](../sigmod/wavguide.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
October 1998<br>

New in Csound version 3.49
