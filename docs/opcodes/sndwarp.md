<!--
id:sndwarp
category:Signal Generators:Granular Synthesis
-->
# sndwarp
Reads a mono sound sample from a table and applies time-stretching and/or pitch modification.

_sndwarp_ reads sound samples from a table and applies time-stretching and/or pitch modification. Time and frequency modification are independent from one another. For example, a sound can be stretched in time while raising the pitch!

The window size and overlap arguments are important to the result and should be experimented with. In general they should be as small as possible. For example, start with _iwsize_=_sr_/10 and _ioverlap_=15. Try _irandw_=_iwsize_*0.2. If you can get away with less overlaps, the program will be faster. But too few may cause an audible flutter in the amplitude. The algorithm reacts differently depending upon the input sound and there are no fixed rules for the best use in all circumstances. But with proper tuning, excellent results can be achieved.

## Syntax
=== "Modern"
    ``` csound-orc
    ares [, ac] = sndwarp(xamp, xtimewarp, xresample, ifn1, ibeg, iwsize, \
                          irandw, ioverlap, ifn2, itimemode)
    ```

=== "Classic"
    ``` csound-orc
    ares [, ac] sndwarp xamp, xtimewarp, xresample, ifn1, ibeg, iwsize, \
                        irandw, ioverlap, ifn2, itimemode
    ```

### Initialization

_ifn1_ -- the number of the table holding the sound samples which will be subjected to the _sndwarp_ processing. [GEN01](../scoregens/gen01.md) is the appropriate function generator to use to store the sound samples from a pre-existing soundfile.

_ibeg_ -- the time in seconds to begin reading in the table (or soundfile). When _itimemode_ is non- zero, the value of _xtimewarp_ is offset by _ibeg_.

_iwsize_ -- the window size in samples used in the time scaling algorithm.

_irandw_ -- the bandwidth of a random number generator. The random numbers will be added to _iwsize_.

_ioverlap_ -- determines the density of overlapping windows.

_ifn2_ -- a function used to shape the window. It is usually used to create a ramp of some kind from zero at the beginning and back down to zero at the end of each window. Try using a half sine (i.e.: f1 0 16384 9 .5 1 0) which works quite well. Other shapes can also be used.

### Performance

_ares_ -- the single channel of output from the _sndwarp_ unit generator. _sndwarp_ assumes that the function table holding the sampled signal is a mono one. This simply means that _sndwarp_ will index the table by single-sample frame increments. The user must be aware then that if a stereo signal is used with _sndwarp_, time and pitch will be altered accordingly.

_ac_ (optional) -- a single-layer (no overlaps), unwindowed versions of the time and/or pitch altered signal. They are supplied in order to be able to balance the amplitude of the signal output, which typically contains many overlapping and windowed versions of the signal, with a clean version of the time-scaled and pitch-shifted signal. The _sndwarp_ process can cause noticeable changes in amplitude, (up and down), due to a time differential between the overlaps when time-shifting is being done. When used with a [balance](../opcodes/balance.md) unit, _ac_ can greatly enhance the quality of sound.

_xamp_ -- the value by which to scale the amplitude (see note on the use of this when using _ac_).

_xtimewarp_ -- determines how the input signal will be stretched or shrunk in time. There are two ways to use this argument depending upon the value given for _itimemode_. When the value of _itimemode_ is 0, _xtimewarp_ will scale the time of the sound. For example, a value of 2 will stretch the sound by 2 times. When _itimemode_ is any non-zero value then _xtimewarp_ is used as a time pointer in a similar way in which the time pointer works in [lpread](../opcodes/lpread.md) and [pvoc](../opcodes/pvoc.md). An example below illustrates this. In both cases, the pitch will _not_ be altered by this process. Pitch shifting is done independently using _xresample_.

_xresample_ -- the factor by which to change the pitch of the sound. For example, a value of 2 will produce a sound one octave higher than the original. The timing of the sound, however, will _not_ be altered.

## Examples

Here is an example of the sndwarp opcode. It uses the file [sndwarp.csd](../examples/sndwarp.csd).

``` csound-orc title="Example of the sndwarp opcode." linenums="1"
--8<-- "examples/sndwarp.csd"
```

<title>Other examples</title>

The below example shows a slowing down or stretching of the sound stored in the stored table (_ifn1_). Over the duration of the note, the stretching will grow from no change from the original to a sound which is ten times &#8220;slower&#8221; than the original. At the same time the overall pitch will move upward over the duration by an octave.

``` csound-orc
iwindfun = 1
isampfun = 2
ibeg = 0
iwindsize = 2000
iwindrand = 400
ioverlap = 10
awarp   line    1, p3, 1
aresamp line    1, p3, 2
kenv    line    1, p3, .1
asig    sndwarp kenv, awarp, aresamp, isampfun, ibeg, iwindsize, iwindrand, \
                ioverlap, iwindfun, 0
```

Now, here is an example using _xtimewarp_ as a time pointer and using stereo:

``` csound-orc
itimemode     =         1
atime         line      0, p3, 10
ar1, ar2      sndwarpst kenv, atime, aresamp, sampfun, ibeg, iwindsize, \
                        iwindrand, ioverlap, iwindfun, itimemode
```

In the above, _atime_ advances the time pointer used in the _sndwarpst_ from 0 to 10 over the duration of the note. If p3 is 20 then the sound will be two times slower than the original. Of course you can use a more complex function than just a single straight line to control the time factor.

Now the same as above but using the _balance_ function with the optional outputs:

``` csound-orc
asig,acmp   sndwarp 1, awarp, aresamp, isampfun, ibeg, iwindsize, iwindrand, \
                    ioverlap, iwindfun, itimemode
abal        balance asig, acmp

asig1,asig2,acmp1,acmp2 sndwarpst 1, atime, aresamp, sampfun, ibeg, iwindsize, \
                                  iwindrand, ioverlap, iwindfun, itimemode
abal1       balance asig1, acmp1
abal2       balance asig2, acmp2
```

In the above two examples notice the use of the _balance_ unit. The output of _balance_ can then be scaled, enveloped, sent to an _out_ or _outs_, and so on. Notice that the amplitude arguments to _sndwarp_ and _sndwarpst_ are &#8220;1&#8221; in these examples. By scaling the signal after the _sndwarp_ process, _abal_, _abal1_, and _abal2_ should contain signals that have nearly the same amplitude as the original input signal to the _sndwarp_ process. This makes it much easier to predict the levels and avoid samples out of range or sample values that are too small.

> :memo: **More Advice**
>
> Only use the stereo version when you really need to be processing a stereo file. It is somewhat slower than the mono version and if you use the _balance_ function it is slower again. There is nothing wrong with using a mono _sndwarp_ in a stereo orchestra and sending the result to one or both channels of the stereo output!


## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Richard Karpen<br>
Seattle, WA USA<br>
1997<br>
