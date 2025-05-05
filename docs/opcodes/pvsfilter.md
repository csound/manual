<!--
id:pvsfilter
category:Spectral Processing:Streaming
-->
# pvsfilter
Multiply amplitudes of a pvoc stream by those of a second pvoc stream, with dynamic scaling.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsfilter(fsigin, fsigfil, kdepth [, igain])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsfilter fsigin, fsigfil, kdepth [, igain]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_fsigfil_ -- filtering pvoc stream.

_kdepth_ -- controls the depth of filtering of fsigin by fsigfil .

_igain_ -- amplitude scaling (optional, defaults to 1).

Here the input pvoc stream amplitudes are modified by the filtering stream, keeping its frequencies intact. As usual, both signals have to be in the same format.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

``` csound-orc
kfreq  expon 500, p3, 4000           ; 3-octave sweep
kdepth linseg 1, p3/2, 0.5, p3/2, 1  ; varying filter depth

asig  in                             ; input
afil  oscili  1, kfreq, 1            ; filter t-domain signal

fim   pvsanal  asig,1024,256,1024,0  ; pvoc analysis
fil   pvsanal  afil,1024,256,1024,0  
fou   pvsfilter fim, fil, kdepth     ; filter signal
aout  pvsynth  fou                   ; pvoc synthesis
```

In the example above the filter curve will depend on the spectral envelope of afil; in the simple case of a sinusoid, it will be equivalent to a narrowband band-pass filter.

Here is an example of the use of the _pvsfilter_ opcode. It uses the file [pvsfilter.csd](../examples/pvsfilter.csd).

``` csound-csd title="Example of the _pvsfilter_ opcode." linenums="1"
--8<-- "examples/pvsfilter.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
