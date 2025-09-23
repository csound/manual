<!--
id:convolve
category:Signal Modifiers:Convolution and Morphing
-->
# convolve
Convolves a signal and an impulse response.

Output is the convolution of signal _ain_ and the impulse response contained in _ifilcod_. If more than one output signal is supplied, each will be convolved with the same impulse response. Note that it is considerably more efficient to use one instance of the operator when processing a mono input to create stereo, or quad, outputs.

Note: this opcode can also be written as [convle](../opcodes/convle.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [, ar2] [, ar3] [, ar4] = convolve(ain, ifilcod [, ichannel])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [, ar2] [, ar3] [, ar4] convolve ain, ifilcod [, ichannel]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting an impulse response data file. An integer denotes the suffix of a file _convolve.m_; a character string (in double quotes) gives a filename, optionally a full pathname. If not a fullpath, the file is sought first in the current directory, then in the one given by the environment variable SADIR (if defined). The data file contains the Fourier transform of an impulse response. Memory usage depends on the size of the data file, which is read and held entirely in memory during computation, but which is shared by multiple calls.

_ichannel_ (optional) -- which channel to use from the impulse response data file.

### Performance

_ain_ -- input audio signal.

_convolve_ implements Fast Convolution. The output of this operator is delayed with respect to the input. The following formulas should be used to calculate the delay:

```
For (1/kr) <= IRdur:
        Delay = ceil(IRdur * kr) / kr
For (1/kr) > IRdur: 
        Delay = IRdur * ceil(1/(kr*IRdur))
Where:
        kr  = Csound control rate
        IRdur = duration, in seconds, of impulse response
        ceil(n) = smallest integer not smaller than n
```

One should be careful to also take into account the initial delay, if any, of the impulse response. For example, if an impulse response is created from a recording, the soundfile may not have the initial delay included. Thus, one should either ensure that the soundfile has the correct amount of zero padding at the start, or, preferably, compensate for this delay in the orchestra (the latter method is more efficient). To compensate for the delay in the orchestra, subtract the initial delay from the result calculated using the above formula(s), when calculating the required delay to introduce into the 'dry' audio path.

For typical applications, such as reverb, the delay will be in the order of 0.5 to 1.5 seconds, or even longer. This renders the current implementation unsuitable for real time applications. It could conceivably be used for real time filtering however, if the number of taps is small enough.

The author intends to create a higher-level operator at some stage, that would mix the wet &amp; dry signals, using the correct amount of delay automatically.

## Examples

Create frequency domain impulse response file using the [cvanal utility](../utility/cvanal.md):

```
csound -Ucvanal l1_44.wav l1_44.cv
```

Determine duration of impulse response. For high accuracy, determine the number of sample frames in the impulse response soundfile, and then compute the duration with:

```
duration = (sample frames)/(sample rate of soundfile)
```

This is due to the fact that the [sndinfo utility](../utility/sndinfo.md) only reports the duration to the nearest 10ms. If you have a utility that reports the duration to the required accuracy, then you can simply use the reported value directly.

```
sndinfo l1_44.wav
```

```
length = 60822 samples, sample rate = 44100

Duration = 60822/44100 = 1.379s.
```

Determine initial delay, if any, of impulse response. If the impulse response has not had the initial delay removed, then you can skip this step. If it has been removed, then the only way you will know the initial delay is if the information has been provided separately. For this example, let us assume that the initial delay is 60ms (0.06s)

Determine the required delay to apply to the dry signal, to align it with the convolved signal:

```
If kr = 441:
      1/kr = 0.0023, which is <= IRdur (1.379s), so:
      Delay1  = ceil(IRdur * kr) / kr
              = ceil(608.14) / 441
              = 609/441
              = 1.38s


Accounting for the initial delay:
      Delay2  = 0.06s
 Total delay  = delay1 - delay2
              = 1.38 - 0.06
              = 1.32s
```

=== "Modern"
    Here is a similar example of the convolve opcode. It uses the file [convolve-modern.csd](../examples/convolve-modern.csd).
    ``` csound-csd title="Example of the convolve opcode." linenums="1"
    --8<-- "examples/convolve-modern.csd"
    ```

=== "Classic"
    Here is a similar example of the convolve opcode. It uses the file [convolve.csd](../examples/convolve.csd).
    ``` csound-csd title="Example of the convolve opcode." linenums="1"
    --8<-- "examples/convolve.csd"
    ```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Greg Sullivan

1996

New in version 3.28
