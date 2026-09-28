<!--
id:deltap3
category:Signal Modifiers:Delay
-->
# deltap3
Taps a delay line at variable offset times, uses cubic interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = deltap3(xdlt [, indx])
    ```

=== "Classic"
    ``` csound-orc
    ares deltap3 xdlt [, indx]
    ```

### Initialization

_indx_ (optional, default=0) -- selects a pending _delayr_ at initialization. Zero selects the newest reader. Pass the optional i-rate output of _delayr_ to select that reader. See [Selecting a delay line](delayr.md#selecting-a-delay-line) for index values and placement before _delayw_.

### Performance

_xdlt_ -- specifies the tapped delay time in seconds. Each can range from 1 control period to the full delay time of the read/write pair; however, since there is no internal check for adherence to this range, the user is wholly responsible. Each argument can be a constant, a variable, or a time-varying signal; the _xdlt_ argument in _deltap3_ implies that an audio-varying delay is permitted there.

_deltap3_ is experimental, and uses cubic interpolation. (New in Csound version 3.50.)

This opcode can tap into a [delayr](../opcodes/delayr.md)/[delayw](../opcodes/delayw.md) pair, extracting delayed audio from the _idlt_ seconds of stored sound. There can be any number of _deltap_ and/or _deltapi_ units between a read/write pair. Each receives an audio tap with no change of original amplitude.

This opcode can provide multiple delay taps for arbitrary delay path and feedback networks. They can deliver either constant-time or time-varying taps, and are useful for building chorus effects, harmonizers, and Doppler shifts. Constant-time delay taps (and some slowly changing ones) do not need interpolated readout; they are well served by _deltap_. Medium-paced or fast varying dlt's, however, will need the extra services of _deltapi_.

_delayr_/_delayw_ pairs may be interleaved. With the default index, put a tap after its reader and before any following _delayr_ or the matching _delayw_. An explicit _indx_ can select an earlier pending reader even when another _delayr_ intervenes. Jens Groh and John ffitch added interleaved read/write pairs in Csound 3.57.

_N.B._ k-rate delay times are not internally interpolated, but rather lay down stepped time-shifts of audio samples; this will be found quite adequate for slowly changing tap times. For medium to fast-paced changes, however, one should provide a higher resolution audio-rate timeshift as input.

## Examples

``` csound-orc title="deltap example #1" linenums="1"
asource  buzz      1, 440, 20, 1
atime    linseg    1, p3/2,.01, p3/2,1   ; trace a distance in secs
ampfac   =         1/atime/atime         ; and calc an amp factor
adump    delayr    1                     ; set maximum distance
amove    deltapi   atime                 ; move sound source past
         delayw    asource               ; the listener
         out       amove * ampfac
```

``` csound-orc title="deltap example #2" linenums="1"
  ainput1 =	..... 
  ainput2 =	..... 
  kdlyt1  =	..... 
  kdlyt2  =	..... 

;Read delayed signal, first delayr instance:
  adump   delayr  4.0 
  adly1   deltap  kdlyt1       ; associated with first delayr instance

;Read delayed signal, second delayr instance:
  adump   delayr  4.0 
  adly2   deltap  kdlyt2       ; associated with second delayr instance

;Do some cross-coupled manipulation:
  afdbk1  =       0.7 * adly1 + 0.7 * adly2 + ainput1 
  afdbk2  =       -0.7 * adly1 + 0.7 * adly2 + ainput2 

;Feed back signal, associated with first delayr instance:
          delayw  afdbk1 

;Feed back signal, associated with second delayr instance:
          delayw  afdbk2
          outs    adly1, adly2
```

Here is yet another example of the deltap3 opcode. It uses the file [deltap3.csd](../examples/deltap3.csd).

``` csound-csd title="Example of the deltap3 opcode." linenums="1"
--8<-- "examples/deltap3.csd"
```

## See also

[Delay](../sigmod/delayops.md)
