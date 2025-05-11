<!--
id:bqrez
category:Signal Modifiers:Standard Filters:Resonant
-->
# bqrez
A second-order multi-mode filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = bqrez(asig, xfco, xres [, imode] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares bqrez asig, xfco, xres [, imode] [, iskip]
    ```

### Initialization

_imode_ (optional, default=0) -- The mode of the filter. Choose from one of the following:

* 0 = low-pass (default)
* 1 = high-pass
* 2 = band-pass
* 3 = band-reject
* 4 = all-pass

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_ares_ -- output audio signal.

_asig_ -- input audio signal.

_xfco_ -- filter cut-off frequency in Hz. May be i-time, k-rate, a-rate.

_xres_ -- amount of resonance. Values of 1 to 100 are typical. Resonance should be one or greater. A value of 100 gives a 20dB gain at the cutoff frequency. May be i-time, k-rate, a-rate.

All filter modes can be frequency modulated as well as the resonance can also be frequency modulated.

_bqrez_ is a resonant low-pass filter created using the Laplace s-domain equations for low-pass, high-pass, and band-pass filters normalized to a frequency. The bi-linear transform was used which contains a frequency transform constant from s-domain to z-domain to exactly match the frequencies together. Alot of trigonometric identities where used to simplify the calculation. It is very stable across the working frequency range up to the Nyquist frequency.

## Examples

=== "Modern"
    Here is an example of the bqrez opcode. It uses the file [bqrez-modern.csd](../examples/bqrez-modern.csd).
    ``` csound-csd title="Example of the bqrez opcode borrowed from the &#8220;rezzy&#8221; opcode in Kevin Conder's manual." linenums="1"
    --8<-- "examples/bqrez-modern.csd"
    ```

=== "Classic"
    Here is an example of the bqrez opcode. It uses the file [bqrez.csd](../examples/bqrez.csd).
    ``` csound-csd title="Example of the bqrez opcode borrowed from the &#8220;rezzy&#8221; opcode in Kevin Conder's manual." linenums="1"
    --8<-- "examples/bqrez.csd"
    ```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Matt Gerassimoff<br>
New in version 4.32<br>
Written in November 2002.<br>
