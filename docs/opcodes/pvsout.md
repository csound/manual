<!--
id:pvsout
category:Spectral Processing:Streaming
-->
# pvsout
Write a fsig to the pvs output bus.

This opcode writes a fsig to a channel of the pvs output bus. Note that the pvs out bus and the pvs in bus are separate and independent. A new channel is created if non-existent.

## Syntax
=== "Modern"
    ``` csound-orc
    pvsout(fsig, kchan)
    ```

=== "Classic"
    ``` csound-orc
    pvsout fsig, kchan
    ```

### Performance

_fsig_ -- fsig input data.

_kchan_ -- pvs out bus channel number.

## Examples

``` csound-orc
asig     in                                ; input
fsig     pvsanal asig, 1024, 256, 1024, 1  ; analysis
         pvsout  fsig, 0                   ; write signal to pvs out bus channel 0
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
August 2006 <br>
