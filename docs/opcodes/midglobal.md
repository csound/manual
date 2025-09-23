<!--
id:midglobal
category:Remote Opcodes
-->
# midglobal
An opcode which can be used to implement a remote midi orchestra. This opcode will broadcast the midi events to all the machines involved in the remote concert.

With the [midremot](../opcodes/midremot.md) and _midglobal_ opcodes you are able to perform instruments on remote machines and control them from a master machine. The remote opcodes are implemented using the master/client model. All the machines involved contain the same orchestra but only the master machine contains the information of the midi score. During the performance the master machine sends the midi events to the clients. The midglobal opcode sends the events to all the machines involved in the remote concert. These machines are determined by the [midremot](../opcodes/midremot.md) definitions made above the _midglobal_ command. To send events to only one machine use [midremot](../opcodes/midremot.md).

## Syntax
=== "Modern"
    ``` csound-orc
    midglobal(isource, instrnum [, instrnum...])
    ```

=== "Classic"
    ``` csound-orc
    midglobal isource, instrnum [, instrnum...]
    ```

### Initialization

_isource_ -- a string that is the intended host computer (e.g. 192.168.0.100). This is the source host which generates the events of the given instrument(s) and sends it to all the machines involved in the remote concert.

_instrnum_ -- a list of instrument numbers which will be played on the destination machines

## Examples

See the entry for [midremot](../opcodes/midremot.md) for an example of usage.

## See also

[Remote Opcodes](../oscnetwork/Remote.md)

## Credits

Author: Simon Schampijer<br>
2006<br>

New in version 5.03
