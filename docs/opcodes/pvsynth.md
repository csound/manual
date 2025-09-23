<!--
id:pvsynth
category:Spectral Processing:Streaming
-->
# pvsynth
Resynthesise phase vocoder data (f-signal) using a FFT overlap-add.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvsynth(fsrc, [iinit])
    ```

=== "Classic"
    ``` csound-orc
    ares pvsynth fsrc, [iinit]
    ```

### Performance

_ares_ -- output audio signal

_fsrc_ -- input signal

_iinit_ -- not yet implemented.

## Examples

``` csound-orc title="Example (using score-supplied f-table, assuming fsig _fftsize = 1024_)"
; score f-table using cubic spline to define shaped peaks
f1 0 513 8 0 2 1 3 0 4 1 6 0 10 1 12 0 16 1 32 0 1 0 436 0

asig    buzz     20000, 199, 50, 1         ; pulsewave source
fsig    pvsanal  asig, 1024, 256, 1024, 0  ; create fsig
kmod    linseg   0, p3/2, 1, p3/2, 0       ; simple control sig

fsigout pvsmaska fsig, 2, kmod             ; apply weird eq to fsig
aout    pvsynth  fsigout                   ; resynthesize,
        dispfft  aout, 0.1, 1024           ; and view the effect
```

Here is an example of the pvsynth opcode. It uses the file [pvsynth.csd](../examples/pvsynth.csd).

``` csound-csd title="Example of the pvsynth opcode." linenums="1"
--8<-- "examples/pvsynth.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13

February 2004. Thanks to a note from Francisco Vila, updated the example.
