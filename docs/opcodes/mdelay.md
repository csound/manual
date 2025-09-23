<!--
id:mdelay
category:Signal I/O:Signal Output
-->
# mdelay
A MIDI delay opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    mdelay(kstatus, kchan, kd1, kd2, kdelay)
    ```

=== "Classic"
    ``` csound-orc
    mdelay kstatus, kchan, kd1, kd2, kdelay
    ```

### Performance

_kstatus_ -- status byte of MIDI message to be delayed

_kchan_ -- MIDI channel (1-16)

_kd1_ -- first MIDI data byte

_kd2_ -- second MIDI data byte

_kdelay_ -- delay time in seconds

Each time that _kstatus_ is other than zero, _mdelay_ outputs a MIDI message to the MIDI out port after _kdelay_ seconds. This opcode is useful in implementing MIDI delays. Several instances of _mdelay_ can be present in the same instrument with different argument values, so complex and colorful MIDI echoes can be implemented. Further, the delay time can be changed at k-rate.

## Examples

Here is an example of the mdelay opcode. It uses the file [mdelay.csd](../examples/mdelay.csd).

``` csound-csd title="Example of the mdelay opcode." linenums="1"
--8<-- "examples/mdelay.csd"
```

## See also

[MIDI Message Output](../midi/output.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
November 1998<br>

New in Csound version 3.492
