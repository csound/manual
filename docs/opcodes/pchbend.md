<!--
id:pchbend
category:Real-time MIDI:Input
-->
# pchbend
Get the current pitch-bend value for this channel.

## Syntax
=== "Modern"
    ``` csound-orc
    ibend = pchbend([imin] [, imax])
    kbend = pchbend([imin] [, imax])
    ```

=== "Classic"
    ``` csound-orc
    ibend pchbend [imin] [, imax]
    kbend pchbend [imin] [, imax]
    ```

### Initialization

_imin, imax_ (optional) -- set minimum and maximum limits on values obtained

### Performance

Get the current pitch-bend value for this channel. Note that this access to pitch-bend data is independent of the MIDI pitch, enabling the value here to be used for any arbitrary purpose.

## Examples

Here is an example of the pchbend opcode. It uses the file [pchbend.csd](../examples/pchbend.csd).

``` csound-csd title="Example of the pchbend opcode." linenums="1"
--8<-- "examples/pchbend.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>
