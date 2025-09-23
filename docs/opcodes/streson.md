<!--
id:streson
category:Signal Generators:Waveguide Physical Modeling
-->
# streson
A string resonator with variable fundamental frequency.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = streson(asig, kfr, kfdbgain)
    ```

=== "Classic"
    ``` csound-orc
    ares streson asig, kfr, kfdbgain
    ```

### Performance

_asig_ -- the input audio signal.

_kfr_ -- the fundamental frequency of the string.

_kfdbgain_ -- feedback gain, typically between 0 and 1, of the internal delay line. A value close to 1 creates a slower decay and a more pronounced resonance. Small values may leave the input signal unaffected. Depending on the filter frequency, typical values are &gt; 0.9.  Values down to -1 are also useful.

_streson_ passes the input _asig_ through a network composed of comb, low-pass and all-pass filters, similar to the one used in some versions of the Karplus-Strong algorithm, creating a string resonator effect. The fundamental frequency of the &#8220;string&#8221; is controlled by the k-rate variable _kfr_.This opcode can be used to simulate sympathetic resonances to an input signal.

See [Modal Frequency Ratios](../misc/modalfreq.md) for frequency ratios of real instruments which can be used to determine the values of _kfrq_.

_streson_ is an adaptation of the StringFlt object of the SndObj Sound Object Library developed by the author.

## Examples

Here is an example of the streson opcode. It uses the file [streson.csd](../examples/streson.csd).

``` csound-csd title="Example of the streson opcode." linenums="1"
--8<-- "examples/streson.csd"
```

## See also

[Waveguides](../sigmod/wavguide.md)

## Credits

Author: Victor Lazzarini<br>
Music Department<br>
National University of Ireland, Maynooth<br>
Maynooth, Co. Kildare<br>
1998<br>

New in Csound version 3.494
