<!--
id:dam
category:Signal Modifiers:Amplitude Modifiers
-->
# dam
A dynamic compressor/expander.

This opcode dynamically modifies a gain value applied to the input sound _ain_ by comparing its power level to a given threshold level. The signal will be compressed/expanded with different factors regarding that it is over or under the threshold.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dam(asig, kthreshold, icomp1, icomp2, irtime, iftime)
    ```

=== "Classic"
    ``` csound-orc
    ares dam asig, kthreshold, icomp1, icomp2, irtime, iftime
    ```

### Initialization

_icomp1_ -- compression ratio for upper zone.

_icomp2_ -- compression ratio for lower zone

_irtime_ -- gain rise time in seconds. Time over which the gain factor is allowed to raise of one unit.

_iftime_ -- gain fall time in seconds. Time over which the gain factor is allowed to decrease of one unit.

### Performance

_asig_ -- input signal to be modified

_kthreshold_ -- level of input signal which acts as the threshold. Can be changed at k-time (e.g. for ducking)

Note on the compression factors: A compression ratio of one leaves the sound unchanged. Setting the ratio to a value smaller than one will compress the signal (reduce its volume) while setting the ratio to a value greater than one will expand the signal (augment its volume).

## Examples

Because the results of the _dam_ opcode can be subtle, I recommend looking at them in a graphical audio editor program like _audacity_. _audacity_ is available for Linux, Windows, and the MacOS and may be downloaded from [http://audacity.sourceforge.net](http://audacity.sourceforge.net/).

Here is an example of the dam opcode. It uses the file [dam.csd](../examples/dam.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="An example of the dam opcode compressing an audio signal." linenums="1"
--8<-- "examples/dam.csd"
```

This example compresses the audio file &#8220;drumsMlp.wav&#8221;. You should hear a drum pattern repeat twice. The second time, the sound should be quieter (compressed) than the first.

Here is another example of the dam opcode. It uses the file [dam_expanded.csd](../examples/dam_expanded.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="An example of the dam opcode expanding an audio signal." linenums="1"
--8<-- "examples/dam_expanded.csd"
```

This example expands the audio file &#8220;drumsMlp.wav&#8221;. You should hear a drum pattern repeat twice. The second time, the sound should be louder (expanded) than the first. To prevent distortion the volume of the signal has been lowered.

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)

## Credits

Author: Marc Resibois<br>
Belgium<br>
1997<br>

New in version 3.47
