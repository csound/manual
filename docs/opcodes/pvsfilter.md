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

_kdepth_ -- filtering depth, limited to the range 0 to 1. At 0, the filter has no effect. At 1, each input amplitude is multiplied by the corresponding filter amplitude.

_igain_ -- amplitude scaling (optional, defaults to 1).

The output keeps the frequencies or phases of _fsigin_. Both streams must use the same analysis settings and spectral format. For each bin, the output amplitude is:

``` text
input amplitude * ((1 - depth) + filter amplitude * depth) * gain
```

For frame-based analysis, a new frame from either input updates the output, using the latest frame from the other input. A fixed input spectrum can therefore use a changing filter. If a source changes its analysis settings, reinitialize _pvsfilter_ with matching inputs.

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
