<!--
id:GENwave
category:
-->
# GENwave
Generates a compactly supported wavelet, scaling function or wavelet packet.

The output function is obtained by deconvolution of corresponding mirror filter impulse response. This procedure is applied in an iterative fashion.

The filter bank used in classic discrete wavelet transform grows only towards low frequencies. Meanwhile wavelet packet transform introduces any possible direction of tree's growth. The sequence of mirror filters used in deconvolution is determined by binary form of seq value. "0" corresponds to low-pass filter and "1" to high-pass.

The number of iteration steps is determined by filter's length and size of function table. I.e. for filter length 8 and table size 256 there are log2(256/8) = 5 iterations available.

## Syntax
``` csound-orc
f # time size "wave" fnsf seq rescale
```

### Initialization

_size_ -- number of points in the table. Must be a power of 2 or power-of-2 plus 1 (see [f statement](../scoregens/f.md)).

_fnsf_ -- pre-existing table with scaling function coefficients.

_seq_ -- non-negative integer number which corresponds to sequence of low-pass and high-pass mirror filters during deconvolution procedure.

_rescale_ -- if not zero the table is not rescaled

## Examples

Here is an example of the GENwave routine. It uses the file [genwave.csd](../examples/genwave.csd).

``` csound-csd title="Example of the GENwave routine." linenums="1"
--8<-- "examples/genwave.csd"
```

## See Also

Ingrid Daubechies. Ten Lectures on Wavelets, SIAM 1992.

Pedro A.G. Batista. An Introduction to Sound Synthesis with Wavelet Packets, Csound Book CD Chapters, MIT 2000.

Victor M. Wickerhauser. Acoustic Signal Compression with Wavelet Packets, Yale 1992.

## Credits

Written by Gleb Rogozinsky

Saint-Petersburg University of Film and Television

Saint-Petersburg, Russia

April 2012
