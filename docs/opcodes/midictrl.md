<!--
id:midictrl
category:Real-time MIDI:Input
-->
# midictrl
Get the current value (0-127) of a specified MIDI controller.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = midictrl(inum [, imin] [, imax])
    kval = midictrl(inum [, imin] [, imax])
    ```

=== "Classic"
    ``` csound-orc
    ival midictrl inum [, imin] [, imax]
    kval midictrl inum [, imin] [, imax]
    ```

### Initialization

_inum_ -- MIDI controller number (0-127)

_imin, imax_ -- set minimum and maximum limits on values obtained.

### Performance

Get the current value (0-127) of a specified MIDI controller.

> :warning: **Warning**
>
> _midictrl_ should only be used in notes that were triggered from MIDI, so that an associated channel number is available. For notes activated from the score, line events, or orchestra, the [ctrl7](../opcodes/ctrl7.md) opcode that takes an explicit channel number should be used instead.

## Examples

Here is an example of the midictrl opcode. It uses the file [midictrl.csd](../examples/midictrl.csd)

``` csound-csd title="Example of the midictrl opcode." linenums="1"
--8<-- "examples/midictrl.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Thanks goes to Rasmus Ekman for pointing out the correct controller number range.
