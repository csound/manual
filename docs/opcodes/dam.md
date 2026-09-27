<!--
id:dam
category:Signal Modifiers:Amplitude Modifiers
-->
# dam
A dynamic compressor/expander.

Applies a changing gain to the input signal. Separate compression factors control the target gain above and below a threshold.

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

_icomp1_ -- compression ratio above the threshold.

_icomp2_ -- compression ratio below the threshold.

_irtime_ -- time in seconds to increase gain by one unit. For example, a value of 2 allows gain to rise from 1 to 2 in two seconds, if the target stays at 2 or higher. Zero or negative values apply increases immediately.

_iftime_ -- time in seconds to decrease gain by one unit. Zero or negative values apply decreases immediately.

### Performance

_asig_ -- input signal to be modified

_kthreshold_ -- level of input signal which acts as the threshold. Can be changed at k-time (e.g. for ducking)

Gain starts at 1 and moves toward its target without passing it. The rise and fall times set the rate of change, so a smaller gain change takes less time.

The level detector averages the absolute input over 1,000 samples and divides it by the square root of 2. Its response time therefore depends on the sample rate.

A ratio of 1 sets a target gain of 1. Ratios below 1 reduce the level; ratios above 1 raise it. Setting both ratios to 1 leaves the input unchanged.

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
