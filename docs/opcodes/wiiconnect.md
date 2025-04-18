<!--
id:wiiconnect
category:Instrument Control:Sensing and Control
-->
# wiiconnect
Reads data from a number of external Nintendo Wiimote controllers.

Plugin opcode in wiimote. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Opens and at control-rate polls up to four external Nintendo Wiimote controllers.

## Syntax
``` csound-orc
ires wiiconnect [itimeout, imaxnum]
```

### Initialization

_itimeout_ -- integer number of seconds the system should wait for all Wiimotes to be connected.  If not given it defaults to 10 seconds.

_imaxnum_ -- maximum number of Wiimotes to locate.  If not given it defaults to 4.

Initially each Wiimote has its numeric allocation indicated by lighting one of the four LEDs.

_ires_ -- return value is 1 if sucess or zero on failure.

### Performance

> :memo: **Note**
>
> Please note that these opcodes are currently only supported on Linux.

Every control cycle each Wiimote is polled for its status and position.  These values are read by the _wiidata_ opcode.  The result returned is 1 in most cases, but will be zero if a Wiimote disconnects,

## Examples

Here is an example of the wii opcodes. It uses the file [wii.csd](../examples/wii.csd).

``` csound-csd title="Example of the wii opcodes." linenums="1"
--8<-- "examples/wii.csd"
```

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11
