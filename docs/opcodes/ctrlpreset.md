<!--
id:ctrlpreset
category:Real-time MIDI:Input
-->
# ctrlpreset
Defines a preset for MIDI controllers.

## Syntax
=== "Modern"
    ``` csound-orc
    kpreset = ctrlpreset(ktag, kchnl, kctlno1, [kctlno2] [, kctlno3] ...)
    ```

=== "Classic"
    ``` csound-orc
    kpreset ctrlpreset ktag, kchnl, kctlno1, [kctlno2] [, kctlno3] ...
    ```

### Initialization

At initialisation time an internal data structure is created to save the preset, ensuring it is sufficiently large.

### Performance

_kpreset_ -- the numeric tag for where the preset it stored.  If ktag is not zero kpreset will be the same as ktag.

_ktag_ -- the tag for this preset; either a strictly positive integer or zero if the system is to allocate an unused preset.

_kchanl_ -- the MIDI channel to which the preset refers.

_kctlno1_, _kctlno1_, etc. -- MIDI controller numbers and values (0-127).  up to 16 initialisation values are permitted.

## Examples

Here is an example of the ctrlpreset opcode. It uses the file [ctrls.csd](../examples/ctrls.csd).

``` csound-csd title="Example of the ctrlpreset opcode." linenums="1"
--8<-- "examples/ctrls.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Authors: John ffitch and Richard Boulanger<br>

New in Csound version 6.16
