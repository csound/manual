<!--
id:insglobal
category:Remote Opcodes
-->
# insglobal
An opcode which can be used to implement a remote orchestra. This opcode will send note events from a source machine to many destinations.

With the [insremot](../opcodes/insremot.md) and _insglobal_ opcodes you are able to perform instruments on remote machines and control them from a master machine. The remote opcodes are implemented using the master/client model. All the machines involved contain the same orchestra but only the master machine contains the information of the score. During the performance the master machine sends the note events to the clients. The _insglobal_ opcode sends the events to all the machines involved in the remote concert. These machines are determined by the [insremot](../opcodes/insremot.md) definitions made above the _insglobal_ command. To send events to only one machine use [insremot](../opcodes/insremot.md).

## Syntax
=== "Modern"
    ``` csound-orc
    insglobal(isource, instrnum [,instrnum...])
    ```

=== "Classic"
    ``` csound-orc
    insglobal isource, instrnum [,instrnum...]
    ```

### Initialization

_isource_ -- a string that is the intended server computer (e.g. 192.168.0.100). This is the source host which generates the events of the given instrument(s) and sends it to all the machines involved in the remote concert.

_instrnum_ -- a list of instrument numbers which will be played on the destination machines

### Performance

> :memo: **Note**
>
> If is essential the computers using this opcode have the same byte-order, data size (double or float) and pointer size.  One cannot use it with mixed 32 and 64 computers for instance.

> :memo: **Note**
>
> Internally this opcode makes use of the gethostname and gethostbyname functions to determine the client's and server's IP address for checking which messages are for which machine. If a computer has more than one IP address there is no way to control which IP address is found.

> :memo: **Note**
>
> The remote operation does not allow the sending of strings at all.

## Examples

See the entry for [insremot](../opcodes/insremot.md) for an example of usage.

## See also

[Remote Opcodes](../oscnetwork/Remote.md)

## Credits

Author: Simon Schampijer<br>
2006<br>

New in version 5.03
