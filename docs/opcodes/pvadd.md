<!--
id:pvadd
category:Spectral Processing:STFT
-->
# pvadd
Reads from a _pvoc_ file and uses the data to perform additive synthesis.

_pvadd_ reads from a [pvoc](../opcodes/pvoc.md) file and uses the data to perform additive synthesis using an internal array of interpolating oscillators. The user supplies the wave table (usually one period of a sine wave), and can choose which analysis bins will be used in the re-synthesis.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvadd(ktimpnt, kfmod, ifilcod, ifn, ibins [, ibinoffset] \
                 [, ibinincr] [, iextractmode] [, ifreqlim] [, igatefn])
    ```

=== "Classic"
    ``` csound-orc
    ares pvadd ktimpnt, kfmod, ifilcod, ifn, ibins [, ibinoffset] \
               [, ibinincr] [, iextractmode] [, ifreqlim] [, igatefn]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting a control-file derived from [pvanal](../utility/pvanal.md) analysis of an audio signal. An integer denotes the suffix of a file _pvoc.m_; a character-string (in double quotes) gives a filename, optionally a full pathname. If not fullpath, the file is sought first in the current directory, then in the one given by the environment variable [SADIR](../invoke/environment-variables.md) (if defined). _pvoc_ control files contain data organized for fft resynthesis. Memory usage depends on the size of the files involved, which are read and held entirely in memory during computation but are shared by multiple calls (see also [lpread](../opcodes/lpread.md)).

_ifn_ -- table number of a stored function containing a sine wave.

_ibins_ -- number of bins that will be used in the resynthesis (each bin counts as one oscillator in the re-synthesis)

_ibinoffset_ (optional) -- is the first bin used (it is optional and defaults to 0).

_ibinincr_ (optional) -- sets an increment by which _pvadd_ counts up from _ibinoffset_ for _ibins_ components in the re-synthesis (see below for a further explanation).

_iextractmode_ (optional) -- determines if spectral extraction will be carried out and if so whether components that have changes in frequency below _ifreqlim_ or above _ifreqlim_ will be discarded. A value for _iextractmode_ of 1 will cause _pvadd_ to synthesize only those components where the frequency difference between analysis frames is greater than _ifreqlim_. A value of 2 for _iextractmode_ will cause _pvadd_ to synthesize only those components where the frequency difference between frames is less than _ifreqlim_. The default values for _iextractmode_ and _ifreqlim_ are 0, in which case a simple resynthesis will be done. See examples below.

_igatefn_ (optional) -- is the number of a stored function which will be applied to the amplitudes of the analysis bins before resynthesis takes place. If _igatefn_ is greater than 0 the amplitudes of each bin will be scaled by _igatefn_ through a simple mapping process. First, the  amplitudes of all of the bins in all of the frames in the entire analysis file are compared to determine the maximum amplitude value. This value is then used create normalized amplitudes as indeces into the stored function _igatefn_. The maximum amplitude will map to the last point in the function. An amplitude of 0 will map to the first point in the function. Values between 0 and 1 will map accordingly to points along the function table.This will be made clearer in the examples below.

### Performance

_ktimpnt_ and _kfmod_ are used in the same way as in [pvoc](../opcodes/pvoc.md).

## Examples

``` csound-orc
ktime line  0, p3, p3
asig  pvadd ktime, 1, “oboe.pvoc”, 1, 100, 2
```

In the above, _ibins_ is 100 and _ibinoffset_ is 2. Using these settings the resynthesis will contain 100 components beginning with bin #2 (bins are counted starting with 0). That is, resynthesis will be done using bins 2-101 inclusive. It is usually a good idea to begin with bin 1 or 2 since the 0th and often 1st bin have data that is neither necessary nor even helpful for creating good clean resynthesis.

``` csound-orc
ktime line  0, p3, p3
asig  pvadd ktime, 1, “oboe.pvoc”, 1, 100, 2, 2
```

The above is the same as the previous example with the addition of the value 2 used for the optional _ibinincr_ argument. This result will still result in 100 components in the resynthesis, but _pvadd_ will count through the bins by 2 instead of by 1. It will use bins 2, 4, 6, 8, 10, and so on. For _ibins_=10, _ibinoffset_=10, and _ibinincr_=10, _pvadd_ would use bins 10, 20, 30, 40, up to and including 100.

Below is an example using spectral extraction. In this example _iextractmode_ is 1 and _ifreqlim_ is 9. This will cause pvadd to synthesize only those bins where the frequency deviation, averaged over 6 frames, is greater than 9.

``` csound-orc
ktime line  0, p3, p3
asig  pvadd ktime, 1, “oboe.pvoc”, 1, 100, 2, 2, 1, 9
```

If _iextractmode_ were 2 in the above, then only those bins with an average frequency deviation of less than 9 would be synthesized. If tuned correctly, this technique can be used to separate the pitched parts of the spectrum from the noisy parts. In practice this depends greatly on the type of sound, the quality of the recording and digitization, and also on the analysis window size and frame increment.

Next is an example using amplitude gating. The last 2 in the argument list stands for f2 in the score.

``` csound-orc
asig  pvadd ktime, 1, “oboe.pvoc”, 1, 100, 2, 2, 0, 0, 2
```

Suppose the score for the above were to contain:

``` csound-sco
f2 0 512 7 0 256 1 256 1
```

Then those bins with amplitudes of 50% of the maximum or greater would be left unchanged, while those with amplitudes less than 50% of the maximum would be scaled down. In this case the lower the amplitude the more severe the scaling down would be. But suppose the score contains:

``` csound-sco
f2 0 512 5 1 512 .001
```

In this case lower amplitudes will be left unchanged and greater ones will be scaled down, turning the sound &#8220;upside-down&#8221; in terms of the amplitude spectrum! Functions can be arbitrarily complex. Just remember that the normalized amplitude values of the analysis are themselves the indeces into the function.

Finally, both spectral extraction and amplitude gating can be used together. The example below will synthesize only those components that with a frequency deviation of less than 5Hz per frame and it will scale the amplitudes according to f2.

``` csound-orc
asig  pvadd ktime, 1, “oboe.pvoc”, 1, 100, 1, 1, 2, 5, 2
```

> :memo: **USEFUL HINTS**
>
> By using several _pvadd_ units together, one can gradually fade in different parts of the resynthesis, creating various &#8220;filtering&#8221; effects. The author uses _pvadd_ to synthesis one bin at a time to have control over each separate component of the re-synthesis.
>
> If any combination of _ibins_, _ibinoffset_, and _ibinincr_, creates a situation where _pvadd_ is asked to used a bin number greater than the number of bins in the analysis, it will just use all of the available bins, and give no complaint.  So to use every bin just make _ibins_ a big number (ie. 2000).
>
> Expect to have to scale up the amplitudes by factors of 10-100, by the way.

Here is a complete example of the pvadd opcode. It uses the file [pvadd.csd](../examples/pvadd.csd)

``` csound-csd title="Example of the pvadd opcode." linenums="1"
--8<-- "examples/pvadd.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1998<br>

New in Csound version 3.48, additional arguments version 3.56
