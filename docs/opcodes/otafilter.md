<!--
id:otafilter
category:Signal Modifiers:Standard Filters:Resonant
-->
# otafilter
Resonant 4pole non-linear lowpass filter.

Otafilter is a version of [vclpf](../opcodes/vclpf.md) with
non-linearities inserted in the signal path. It attempts to
model the saturation behaviour of an operational transconductance
amplifier (OTA), which is commonly used in the implementation
of analogue filters. The filter has two outputs: the usual 4-pole
output plus a tap midway through the filter structure after the
second stage (a 2-pole output).

## Syntax
=== "Modern"
    ``` csound-orc
    sig4:a, sig2:a  = otafilter(in:a, cf:{a,k}, res:{a,k}, drive:k[, stor:i])
    ```

=== "Classic"
    ``` csound-orc
    asig4,asig2 otafilter ain, xcf, xres, kdrive[, istor]
    ```

### Initialization

_stor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_sig4_ -- 4-pole output

_sig2_ -- 2-pole output

_in_ -- input signal.

_cf_ -- filter cutoff frequency (a- or k-rate)

_res_ -- resonance, between 0 and 1. Higher values will make the
filter self-oscillate (a- or k-rate).

_drive_ -- filter drive gain (0 - no drive, > 0 - increased drive)

## Examples

Here is an example of the otafilter opcode. It uses the file [otafilter.csd](../examples/otafilter.csd).

``` csound-csd title="Example of the otafilter opcode." linenums="1"
--8<-- "examples/otafilter.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
April 2024<br>
