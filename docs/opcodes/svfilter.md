<!--
id:svfilter
category:Signal Modifiers:Standard Filters:Resonant
-->
# svfilter
A resonant second order filter, with simultaneous lowpass, highpass and bandpass outputs.

## Syntax
=== "Modern"
    ``` csound-orc
    alow, ahigh, aband = svfilter(asig, kcf, kq [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    alow, ahigh, aband svfilter asig, kcf, kq [, iscl] [, iskip]
    ```

### Initialization

_iscl_ -- coded scaling factor, similar to that in [reson](../opcodes/reson.md). A non-zero value signifies a peak response factor of 1, i.e. all frequencies other than _kcf_ are attenuated in accordance with the (normalized) response curve. A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_svfilter_ is a second order state-variable filter, with k-rate controls for cutoff frequency and Q.  As Q is increased, a resonant peak forms around the cutoff frequency. _svfilter_ has simultaneous lowpass, highpass, and bandpass filter outputs; by mixing the outputs together, a variety of frequency responses can be generated. The state-variable filter, or "multimode" filter was a common feature in early analog synthesizers, due to the wide variety of sounds available from the interaction between cutoff, resonance, and output mix ratios. _svfilter_ is well suited to the emulation of "analog" sounds, as well as other applications where resonant filters are called for.

_kcf_ -- Cutoff or resonant frequency of the filter, measured in Hz.

_kq_ -- Q of the filter, which is defined (for bandpass filters) as bandwidth/cutoff. _kq_ should be in a range between 1 and 500. As _kq_ is increased, the resonance of the filter increases, which corresponds to an increase in the magnitude and "sharpness" of the resonant peak. When using _svfilter_ without any scaling of the signal (where _iscl_ is either absent or 0), the volume of the resonant peak increases as Q increases. For high values of Q, it is recommended that _iscl_ be set to a non-zero value, or that an external scaling function such as [balance](../opcodes/balance.md) is used.

_svfilter_ is based upon an algorithm in Hal Chamberlin's _Musical Applications of Microprocessor_s (Hayden Books, 1985).

## Examples

Here is an example of the svfilter opcode. It uses the file [svfilter.csd](../examples/svfilter.csd).

``` csound-csd title="Example of the svfilter opcode." linenums="1"
--8<-- "examples/svfilter.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Sean Costello<br>
Seattle, Washington<br>
1999<br>

New in Csound version 3.55

iskip new in version 6.06
