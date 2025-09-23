<!--
id:pvinterp
category:Spectral Processing:STFT
-->
# pvinterp
Interpolates between the amplitudes and frequencies of two phase vocoder analysis files.

_pvinterp_ interpolates between the amplitudes and frequencies, on a bin by bin basis, of two phase vocoder analysis files (one from a previously called _pvbufread_ unit and the other from within its own argument list), allowing for user defined transitions between analyzed sounds. It also allows for general scaling of the amplitudes and frequencies of each file separately before the interpolated values are calculated and sent to the resynthesis routines. The _kfmod_ argument in _pvinterp_ performs its frequency scaling on the frequency values after their derivation from the separate scaling and subsequent interpolation is performed so that this acts as an overall scaling value of the new frequency components.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvinterp(ktimpnt, kfmod, ifile, kfreqscale1, kfreqscale2, \
                    kampscale1, kampscale2, kfreqinterp, kampinterp)
    ```

=== "Classic"
    ``` csound-orc
    ares pvinterp ktimpnt, kfmod, ifile, kfreqscale1, kfreqscale2, \
                  kampscale1, kampscale2, kfreqinterp, kampinterp
    ```

### Initialization

_ifile_ -- the _pvoc_ number (n in pvoc.n) or the name in quotes of the analysis file made using pvanal. (See [pvoc](../opcodes/pvoc.md).)

### Performance

_ktimpnt_ -- the passage of time, in seconds, through this file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

_kfmod_ -- a control-rate transposition factor: a value of 1 incurs no transposition, 1.5 transposes up a perfect fifth, and .5 down an octave.

_kfreqscale1_, _kfreqscale2_, _kampscale1_, _kampscale2_ -- used in _pvinterp_ to scale the frequencies and amplitudes stored in each frame of the phase vocoder analysis file. _kfreqscale1_ and _kampscale1_ scale the frequencies and amplitudes of the data from the file read by the previously called [pvbufread](../opcodes/pvbufread.md) (this data is passed internally to the _pvinterp_ unit). _kfreqscale2_ and _kampscale2_ scale the frequencies and amplitudes of the file named by _ifile_ in the _pvinterp_ argument list and read within the _pvinterp_ unit.

By using these arguments, it is possible to adjust these values before applying the interpolation. For example, if file1 is much louder than file2, it might be desirable to scale down the amplitudes of file1 or scale up those of file2 before interpolating. Likewise one can adjust the frequencies of each to bring them more in accord with one another (or just the opposite, of course!) before the interpolation is performed.

_kfreqinterp_, _kampinterp_ -- used in _pvinterp_, determine the interpolation distance between the values of one phase vocoder file and the values of a second file. When the value of _kfreqinterp_ is 1, the frequency values will be entirely those from the first file (read by the _pvbufread_), post scaling by the _kfreqscale1_ argument. When the value of _kfreqinterp_ is 0 the frequency values will be those of the second file (read by the _pvinterp_ unit itself), post scaling by _kfreqscale2_. When _kfreqinterp_ is between 0 and 1 the frequency values will be calculated, on a bin, by bin basis, as the percentage between each pair of frequencies (in other words, _kfreqinterp_=0.5 will cause the frequencies values to be half way between the values in the set of data from the first file and the set of data from the second file).

_kampinterp_ works in the same way upon the amplitudes of the two files. Since these are k-rate arguments, the percentages can change over time making it possible to create many kinds of transitions between sounds.

## Examples

The example below shows an example using _pvbufread_ with _pvinterp_ to interpolate between the sound of an oboe and the sound of a clarinet. The value of _kinterp_ returned by a _linseg_ is used to determine the timing of the transitions between the two sounds. The interpolation of frequencies and amplitudes are controlled by the same factor in this example, but for other effects it might be interesting to not have them synchronized in this way. In this example the sound will begin as a clarinet, transform into the oboe and then return again to the clarinet sound. The value of _kfreqscale2_ is 1.065 because the oboe in this case is a semitone higher in pitch than the clarinet and this brings them approximately to the same pitch. The value of _kampscale2_ is 0.75 because the analyzed clarinet was somewhat louder than the analyzed oboe. The setting of these two parameters make the transition quite smooth in this case, but such adjustments are by no means necessary or even advocated.

``` csound-orc
ktime1  line      0, p3, 3.5 ; used as index in the "oboe.pvoc" file
ktime2  line      0, p3, 4.5 ; used as index in the  "clar.pvoc" file
kinterp linseg    1, p3*0.15, 1, p3*0.35, 0, p3*0.25, 0, p3*0.15, 1, p3*0.1, 1
        pvbufread ktime1, "oboe.pvoc"
apv     pvinterp  ktime2,1,"clar.pvoc", 1, 1.065, 1, 0.75, 1-kinterp, 1-kinterp
```

Here is a complete example of the pvinterp opcode. It uses the file [pvinterp.csd](../examples/pvinterp.csd)

``` csound-csd title="Example of the pvinterp opcode." linenums="1"
--8<-- "examples/pvinterp.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, Wash<br>
1997<br>
