<!--
id:lufs
category:Utilities
-->
# lufs
Momentary, Integrated and Short-Term Loudness meter in LUFS.

The opcodes performs an analysis of input audio according to ITU-R BS.1770-4 recommendation.

## Syntax
=== "Modern"
    ``` csound-orc
    kmom, kint, kshort = lufs(kreset, ain1 [, ain2])
    ```

=== "Classic"
    ``` csound-orc
    kmom, kint, kshort lufs kreset, ain1 [, ain2]
    ```

### Performance

_kreset_ -- reset input. It resets the value of the integrated loudness if kreset is not 0.

_ain1, ain2_ -- input audio signal(s). Only mono and stereo are supported (see below)

_kmom_ -- momentary loudness in LUFS

_kint_ -- integrated loudness in LUFS

_kshort_ -- short-term loudness in LUFS

The Momentary Loudness is calculated over 400 ms period and Short-Term Loudness is for 3 s period. Integrated Loudness is obtained by averaging the whole programm. The calculation algorithm is based on formulae from [Matlab integratedLoudness code](https://www.mathworks.com/help/audio/ref/integratedloudness.html).

[ITU-R BS.1770-4](https://www.itu.int/dms_pubrec/itu-r/rec/bs/R-REC-BS.1770-4-201510-I!!PDF-E.pdf) gives K-weigthing filters coefficients only for 48000 Hz, thus other sampling frequencies coefficients are calculated according to [Brecht De Man code](https://github.com/BrechtDeMan/loudness.py/blob/master/loudness.py)
Only mono and stereo formats are supported due to rare usage of 5.1 format in the field of computer music. ITU-R BS.1770-4 standardizes only 1, 2 and 5.1 channels.

> :memo: **Warning!**
>
> _ksmps_ should not be set to values higher than _sr_/10, i.e. 4410 @ sr = 44100 and higher.

## Examples

Here is an example of the lufs opcode. It uses the file [lufs.csd](../examples/lufs.csd).

``` csound-csd title="Example of the lufs opcode." linenums="1"
--8<-- "examples/lufs.csd"
```

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)

## Credits

By: Gleb Rogozinsky, Summer 2020

New in version 6.15
