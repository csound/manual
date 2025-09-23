<!--
id:pvsin
category:Spectral Processing:Streaming
-->
# pvsin
Retrieve an fsig from the input software bus; a pvs equivalent to _chani_.

This opcode retrieves an f-sig from the pvs in software bus, which can be used to get data from an external source, using the Csound 5 API. A channel is created if not already existing. The fsig channel is in that case initialised with the given parameters. It is important to note that the pvs input and output (pvsout opcode) busses are independent and data is not shared between them.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsin(kchan [, isize, iolap, iwinsize, iwintype, iformat])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsin kchan [, isize, iolap, iwinsize, iwintype, iformat]
    ```

### Initialization

_isize_ -- initial DFT size,defaults to 1024.

_iolap_ -- size of overlap, defaults to _isize_/4.

_iwinsize_ -- size of analysis window, defaults to _isize_.

_iwintype_ -- type of window, defaults to Hanning (1) (see _pvsanal_)

_iformat_ -- data format, defaults 0 (PVS_AMP_FREQ). Other possible values are 1 (PVS_AMP_PHASE), 2  (PVS_COMPLEX) or 3 (PVS_TRACKS).

### Performance

_fsig_ -- output fsig.

_kchan_ -- channel number. If non-existent, a channel will be created.

## Examples

``` csound-orc
fsig  pvsin   0  ; get data from pvs in bus channel 0
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
August 2006 <br>
