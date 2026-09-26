<!--
id:pvstanal
category:Spectral Processing:Streaming
-->
# pvstanal
Phase vocoder analysis processing with onset detection/processing.

_pvstanal_ reads a sound stored in a [GEN01](../scoregens/gen01.md) function table and produces amplitude+frequency f-signals. It accepts deferred allocation tables. Use one output for each channel in the table, up to 16 outputs.

Pitch and time scaling are independent. The opcode advances the read position internally. Onset detection can briefly suspend time stretching to preserve attacks. All channels use the same read position.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvstanal(ktimescal, kamp, kpitch, ktab [, kdetect, kwrap, ioffset, \
                   ifftsize, ihop, idbthresh])
    fleft, fright = pvstanal(ktimescal, kamp, kpitch, ktab [, kdetect, kwrap, \
                            ioffset, ifftsize, ihop, idbthresh])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvstanal ktimescal, kamp, kpitch, ktab [, kdetect, kwrap, ioffset, \
                 ifftsize, ihop, idbthresh]
    fleft, fright pvstanal ktimescal, kamp, kpitch, ktab [, kdetect, kwrap, \
                          ioffset, ifftsize, ihop, idbthresh]
    ```

### Initialization

_ifftsize_ -- FFT size, a power of two of at least 2. A zero or negative value selects the default, 2048.

_ihop_ -- Hop size in samples, at least _ksmps_. A zero or negative value selects the default, 512. Fractional sample counts are truncated.

_ioffset_ -- Initial read offset in seconds of the source sound, default 0. The source and orchestra may have different sample rates.

_idbthresh_ -- Onset threshold in decibels, default 1. The detector compares the next window's power with the current window's power using _10 log10(next/current)_. A rise above the threshold counts as an onset. For example, doubling the amplitude gives a rise of about 6 dB.

### Performance

_ktimescal_ -- Time scaling ratio: 1 plays at the original speed, values between 0 and 1 stretch time, and values above 1 shorten it. Negative values move the read position backwards. With onset detection off, 0 holds the read position.

_kamp_ -- amplitude scaling

_kpitch_ -- Pitch scaling: 1 keeps the original pitch, values between 0 and 1 lower it, and values above 1 raise it. Negative values reverse the reading direction within each analysis window.

_kdetect_ -- Set to 1 to enable onset detection, or 0 to disable it. The default is 1. When stretching time, an onset on any channel advances all channels at the original speed for that hop.

_ktab_ -- Source sound table. Its channel count must match the number of outputs. Tables can be switched at k-rate, but must keep that channel count.

_kwrap_ -- Set to 1 to loop the read position, or 0 to stop producing frames with sound when the position passes either end of the table. The default is 1. Analysis windows wrap across table ends in either mode.

## Examples

Here is an example of the pvstanal opcode. It uses the file [pvstanal.csd](../examples/pvstanal.csd).

``` csound-csd title="Example of the pvstanal opcode." linenums="1"
--8<-- "examples/pvstanal.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2010<br>

New plugin in version 5.13

February 2005.
