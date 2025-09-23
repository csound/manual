<!--
id:ctrlinit
category:Real-time MIDI:Input
-->
# ctrlinit
Sets the initial values for a set of MIDI controllers.

## Syntax
=== "Modern"
    ``` csound-orc
    ctrlinit(ichnl, ictlno1, ival1 [, ictlno2] [, ival2] [, ictlno3] \
             [, ival3] [,...ival32])
    ```

=== "Classic"
    ``` csound-orc
    ctrlinit ichnl, ictlno1, ival1 [, ictlno2] [, ival2] [, ictlno3] \
             [, ival3] [,...ival32]
    ```

### Initialization

_ichnl_ -- MIDI channel number (1-16)

_ictlno1_, _ictlno1_, etc. -- MIDI controller numbers (0-127)

_ival1_, _ival2_, etc. -- initial value for corresponding MIDI controller number, in the range 0 to 127.

> :memo: **Note**
>
> If this opcode is to be used with a scaling opcode such as ctrl7 the ival1..  should be 127*(initial-min)/(max-min)

### Performance

Sets the initial values for a set of MIDI controllers.

## Examples

Here is an example of the ctrlinit opcode. It uses the file [ctrlinit.csd](../examples/ctrlinit.csd).

``` csound-csd title="Example of the ctrlinit opcode." linenums="1"
--8<-- "examples/ctrlinit.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

[Orchestra Header Statements](../orch/header.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT, Cambridge, Mass.<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
