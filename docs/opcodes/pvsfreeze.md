<!--
id:pvsfreeze
category:Spectral Processing:Streaming
-->
# pvsfreeze
Freeze the amplitude and frequency time functions of a pv stream according to a control-rate trigger.

This opcodes 'freezes' the evolution of pvs stream by locking into steady amplitude and/or frequency values for each bin. The freezing is controlled, independently for amplitudes and frequencies, by a control-rate trigger, which switches the freezing 'on' if equal to or above 1 and 'off' if below 1.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsfreeze(fsigin, kfreeza, kfreezf)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsfreeze fsigin, kfreeza, kfreezf
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_kfreeza_ -- freezing switch for amplitudes. Freezing is on if above or equal to 1 and off if below 1.

_kfcf_ -- freezing switch for frequencies. Freezing is on if above or equal to 1 and off if below 1.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

``` csound-orc
asig  in                                       ; input
ktrig oscil     1.5, 0.25, 1                   ; trigger
fim   pvsanal   asig1, 1024, 256, 1024, 0      ; pvoc analysis 
fou   pvsfreeze fim, abs(ktrig), abs(ktrig)    ; regular 'freeze' of spectra
aout  pvsynth   fou                            ; pvoc synthesis
```

In the example above the input signal will be regularly 'frozen' for a short while, as the trigger rises above 1 about every two seconds.

Here is an example of the use of the _pvsfreeze_ opcode. It uses the file [pvsfreeze.csd](../examples/pvsfreeze.csd).

``` csound-csd title="Example of the _pvsfreeze_ opcode." linenums="1"
--8<-- "examples/pvsfreeze.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
May 2006 <br>

New plugin in version 5

May 2006.
