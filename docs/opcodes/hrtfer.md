<!--
id:hrtfer
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfer
Creates 3D audio for two speakers. Output is binaural (headphone) 3D audio.

> :memo: **Note**
> 
> This opcode is deprecated; use hrtfstat or similar opcode instead

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright = hrtfer(asig, kaz, kelev, "HRTFcompact")
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright hrtfer asig, kaz, kelev, "HRTFcompact"
    ```

### Initialization

_kAz_ -- azimuth value in degrees. Positive values represent position on the right, negative values are positions on the left.

_kElev_ -- elevation value in degrees. Positive values represent position above horizontal, negative values are positions under horizontal.

At present, the only file which can be used with _hrtfer_ is [HRTFcompact](../examples/HRTFcompact). It must be passed to the opcode as the last argument within quotes as shown above.

HRTFcompact may also be obtained via anonymous ftp from: [ftp://ftp.cs.bath.ac.uk/pub/dream/utilities/Analysis/HRTFcompact](ftp://ftp.cs.bath.ac.uk/pub/dream/utilities/Analysis/HRTFcompact)

### Performance

These unit generators place a mono input signal in a virtual 3D space around the listener by convolving the input with the appropriate HRTF data specified by the opcode's azimuth and elevation values. _hrtfer_ allows these values to be k-values, allowing for dynamic spatialization. _hrtfer_ can only place the input at the requested position because the HRTF is loaded in at i-time (remember that currently, CSound has a limit of 20 files it can hold in memory, otherwise it causes a segmentation fault). The output will need to be scaled either by using [balance](../opcodes/balance.md) or by multiplying the output by some scaling constant.

> :memo: **Note**
>
> The sampling rate of the orchestra must be 44.1kHz. This is because 44.1kHz is the sampling rate at which the HRTFs were measured. In order to be used at a different rate, the HRTFs would need to be re-sampled at the desired rate.

## Examples

Here is an example of the hrtfer opcode. It uses the file [hrtfer.csd](../examples/hrtfer.csd),  [HRTFcompact](../examples/HRTFcompact), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the hrtfer opcode." linenums="1"
--8<-- "examples/hrtfer.csd"
```

## See also

[Panning and Spatialization: Binaural spatialization](../sigmod/panspatl.md)

## Credits

Authors: Eli Breder and David MacIntyre<br>
Montreal<br>
1996<br>

Fixed the example thanks to a message from Istvan Varga.
