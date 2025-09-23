<!--
id:pvoc
category:Spectral Processing:STFT
-->
# pvoc
Implements signal reconstruction using an fft-based phase vocoder.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvoc(ktimpnt, kfmod, ifilcod [, ispecwp] [, iextractmode] \
                [, ifreqlim] [, igatefn])
    ```

=== "Classic"
    ``` csound-orc
    ares pvoc ktimpnt, kfmod, ifilcod [, ispecwp] [, iextractmode] \
              [, ifreqlim] [, igatefn]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting a control-file derived from analysis of an audio signal. An integer denotes the suffix of a file _pvoc.m_; a character-string (in double quotes) gives a filename, optionally a full pathname. If not fullpath, the file is sought first in the current directory, then in the one given by the environment variable [SADIR](../invoke/environment-variables.md) (if defined).  _pvoc_ control contains breakpoint amplitude and frequency envelope values organized for fft resynthesis. Memory usage depends on the size of the files involved, which are read and held entirely in memory during computation but are shared by multiple calls (see also [lpread](../opcodes/lpread.md)).

_ispecwp_ (optional) -- if non-zero, attempts to preserve the spectral envelope while its frequency content is varied by _kfmod_. The default value is zero.

_iextractmode_ (optional) -- determines if spectral extraction will be carried out and if so whether components that have changes in frequency below _ifreqlim_ or above _ifreqlim_ will be discarded. A value for _iextractmode_ of 1 will cause _pvoc_ to synthesize only those components where the frequency difference between analysis frames is greater than _ifreqlim_. A value of 2 for _iextractmode_ will cause _pvoc_ to synthesize only those components where the frequency difference between frames is less than _ifreqlim_. The default values for _iextractmode_ and _ifreqlim_ are 0, in which case a simple resynthesis will be done. See examples under [pvadd](../opcodes/pvadd.md) for how to use spectral extraction.

_igatefn_ (optional) -- the number of a stored function which will be applied to the amplitudes of the analysis bins before resynthesis takes place. If _igatefn_ is greater than 0 the amplitudes of each bin will be scaled by _igatefn_ through a simple mapping process. First, the  amplitudes of all of the bins in all of the frames in the entire analysis file are compared to determine the maximum amplitude value. This value is then used create normalized amplitudes as indeces into the stored function _igatefn_. The maximum amplitude will map to the last point in the function. An amplitude of 0 will map to the first point in the function. Values between 0 and 1 will map accordingly to points along the function table. See examples under [pvadd](../opcodes/pvadd.md) for how to use amplitude gating.

### Performance

_ktimpnt_ -- The passage of time, in seconds, through the analysis file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

_kfmod_ -- a control-rate transposition factor: a value of 1 incurs no transposition,
1.5 transposes up a perfect fifth, and .5 down an octave.

_pvoc_ implements signal reconstruction using an fft-based phase vocoder. The control data stems from a precomputed analysis file with a known frame rate.

This implementation of _pvoc_ was orignally written by Dan Ellis. It is based in part on the system of Mark Dolson, but the pre-analysis concept is new. The  spectral extraction and amplitude gating (new in Csound version 3.56) were added by Richard Karpen based on functions in SoundHack by Tom Erbe.

## Examples

Here is an example of the pvoc opcode. It uses the file [pvoc.csd](../examples/pvoc.csd).

``` csound-csd title="Example of the pvoc opcode." linenums="1"
--8<-- "examples/pvoc.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Authors: Dan Ellis and Richard Karpen<br>
Seattle, Wash<br>
1997<br>
