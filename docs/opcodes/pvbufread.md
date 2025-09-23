<!--
id:pvbufread
category:Spectral Processing:STFT
-->
# pvbufread
Reads from a phase vocoder analysis file and makes the retrieved data available.

_pvbufread_ reads from a [pvoc](../opcodes/pvoc.md) file and makes the retrieved data available to any following [pvinterp](../opcodes/pvinterp.md) and [pvcross](../opcodes/pvcross.md) units that appear in an instrument before a subsequent _pvbufread_ (just as [lpread](../opcodes/lpread.md) and [lpreson](../opcodes/lpreson.md) work together). The data is passed internally and the unit has no output of its own.

## Syntax
=== "Modern"
    ``` csound-orc
    pvbufread(ktimpnt, ifile)
    ```

=== "Classic"
    ``` csound-orc
    pvbufread ktimpnt, ifile
    ```

### Initialization

_ifile_ -- the _pvoc_ number (n in pvoc.n) or the name in quotes of the analysis file made using _pvanal_. (See [pvoc](../opcodes/pvoc.md).)

### Performance

_ktimpnt_ -- the passage of time, in seconds, through this file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

## Examples

The example below shows an example using _pvbufread_ with _pvinterp_ to interpolate between the sound of an oboe and the sound of a clarinet. The value of _kinterp_ returned by a _linseg_ is used to determine the timing of the transitions between the two sounds. The interpolation of frequencies and amplitudes are controlled by the same factor in this example, but for other effects it might be interesting to not have them synchronized in this way. In this example the sound will begin as a clarinet, transform into the oboe and then return again to the clarinet sound. The value of _kfreqscale2_ is 1.065 because the oboe in this case is a semitone higher in pitch than the clarinet and this brings them approximately to the same pitch. The value of _kampscale2_ is 0.75 because the analyzed clarinet was somewhat louder than the analyzed oboe. The setting of these two parameters make the transition quite smooth in this case, but such adjustments are by no means necessary or even advocated.

``` csound-orc
ktime1  line      0, p3, 3.5 ; used as index in the "oboe.pvoc" file
ktime2  line      0, p3, 4.5 ; used as index in the  "clar.pvoc" file
kinterp linseg    1, p3*0.15, 1, p3*0.35, 0, p3*0.25, 0, p3*0.15, 1, p3*0.1, 1
        pvbufread ktime1, "oboe.pvoc"
apv     pvinterp  ktime2,1,"clar.pvoc", 1, 1.065, 1, 0.75, 1-kinterp, 1-kinterp
```

Below is an example using _pvbufread_ with _pvcross_. In this example the amplitudes used in the resynthesis gradually change from those of the oboe to those of the clarinet. The frequencies, of course, remain those of the clarinet throughout the process since _pvcross_ does not use the frequency data from the file read by _pvbufread_.

``` csound-orc
ktime1  line      0, p3, 3.5 ; used as index in the "oboe.pvoc" file
ktime2  line      0, p3, 4.5 ; used as index in the "clar.pvoc" file
kcross  expon     0.001, p3, 1
        pvbufread ktime1, "oboe.pvoc"
apv     pvcross   ktime2, 1, "clar.pvoc", 1-kcross, kcross
```

Here is a complete example of the pvbufread opcode. It uses the file [pvbufread.csd](../examples/pvbufread.csd)

``` csound-csd title="Example of the pvbufread opcode." linenums="1"
--8<-- "examples/pvbufread.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1997<br>
