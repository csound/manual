<!--
id:pvcross
category:Spectral Processing:STFT
-->
# pvcross
Applies the amplitudes from one phase vocoder analysis file to the data from a second file and then performs the resynthesis.

The data is passed, as described above, from a previously called [pvbufread](../opcodes/pvbufread.md) unit. The two k-rate amplitude arguments are used to scale the amplitudes of each files separately before they are added together and used in the resynthesis (see below for further explanation). The frequencies of the first file are not used at all in this process. This unit simply allows for cross-synthesis through the application of the amplitudes of the spectra of one signal to the frequencies of a second signal. Unlike [pvinterp](../opcodes/pvinterp.md), _pvcross_ does allow for the use of the _ispecwp_ as in [pvoc](../opcodes/pvoc.md) and [vpvoc](../opcodes/vpvoc.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvcross(ktimpnt, kfmod, ifile, kampscale1, kampscale2 [, ispecwp])
    ```

=== "Classic"
    ``` csound-orc
    ares pvcross ktimpnt, kfmod, ifile, kampscale1, kampscale2 [, ispecwp]
    ```

### Initialization

_ifile_ -- the _pvoc_ number (n in pvoc.n) or the name in quotes of the analysis file made using _pvanal_. (See [pvoc](../opcodes/pvoc.md).)

_ispecwp_ (optional, default=0) -- if non-zero, attempts to preserve the spectral envelope while
its frequency content is varied by _kfmod_. The default value is zero.

### Performance

_ktimpnt_ -- the passage of time, in seconds, through this file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

_kfmod_ -- a control-rate transposition factor: a value of 1 incurs no transposition, 1.5 transposes up a perfect fifth, and 0.5 down an octave.

_kampscale1, kampscale2_ -- used to scale the amplitudes stored in each frame of the phase vocoder analysis file. _kampscale1_ scale the amplitudes of the data from the file read by the previously called _pvbufread_. _kampscale2_ scale the amplitudes of the file named by _ifile_.

By using these arguments, it is possible to adjust these values before applying the interpolation. For example, if file1 is much louder than file2, it might be desirable to scale down the amplitudes of file1 or scale up those of file2 before interpolating. Likewise one can adjust the frequencies of each to bring them more in accord with one another (or just the opposite, of course!) before the interpolation is performed.

## Examples

Below is an example using [pvbufread](../opcodes/pvbufread.md) with _pvcross_. In this example the amplitudes used in the resynthesis gradually change from those of the oboe to those of the clarinet. The frequencies, of course, remain those of the clarinet throughout the process since _pvcross_ does not use the frequency data from the file read by _pvbufread_.

``` csound-orc
ktime1  line      0, p3, 3.5 ; used as index in the "oboe.pvoc" file
ktime2  line      0, p3, 4.5 ; used as index in the "clar.pvoc" file
kcross  expon     0.001, p3, 1
        pvbufread ktime1, "oboe.pvoc"
apv     pvcross   ktime2, 1, "clar.pvoc", 1-kcross, kcross
```

Here is a complete example of the pvcross opcode. It uses the file [pvcross.csd](../examples/pvcross.csd)

``` csound-csd title="Example of the pvcross opcode." linenums="1"
--8<-- "examples/pvcross.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, Wash<br>
1997<br>

New in version 3.44
