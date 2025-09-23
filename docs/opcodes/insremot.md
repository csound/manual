<!--
id:insremot
category:Remote Opcodes
-->
# insremot
An opcode which can be used to implement a remote orchestra. This opcode will send note events from a source machine to one destination.

With the _insremot_ and [insglobal](../opcodes/insglobal.md) opcodes you are able to perform instruments on remote machines and control them from a master machine. The remote opcodes are implemented using the master/client model. All the machines involved contain the same orchestra but only the master machine contains the information of the score. During the performance the master machine sends the note events to the clients. The _insremot_ opcode will send events from a source machine to one destination if you want to send events to many destinations (broadcast) use the [insglobal](../opcodes/insglobal.md) opcode instead. These two opcodes can be used in combination.

## Syntax
=== "Modern"
    ``` csound-orc
    insremot(idestination, isource, instrnum [, instrnum...])
    ```

=== "Classic"
    ``` csound-orc
    insremot idestination, isource, instrnum [, instrnum...]
    ```

### Initialization

_idestination_ -- a string that is the intended client computer (e.g. 192.168.0.100). This is the destination host which receives the events from the given instrument.

_isource_ -- a string that is the intended server computer (e.g. 192.168.0.100). This is the source host which generates the events of the given instrument and sends it to the address given by idestination.

_instrnum_ -- a list of instrument numbers which will be played on the destination machine

### Performance

> :memo: **Note**
>
> If is essential the computers using this opcode have the same byte-order, data size (double or float) and pointer size.  One cannot use it with mixed 32 and 64 computers for instance.

> :memo: **Note**
>
> Internally this opcode may make use of the gethostname and gethostbyname functions to determine the client's and server's IP address for checking which messages are for which machine, or on non-windows system other techniques. If a computer has more than one IP address there is no way to control which IP address is found (but see below).  On non-windows systems the default network is eth0 or en0, and if that fails wlan0.  (Since version 6.05) the network to be used can be set with an environment variable CS_ETHER.

> :memo: **Note**
>
> The remote operation does not allow the sending of strings at all.

## Examples

Here is an example of the insremot opcode. It uses the files [insremot.csd](../examples/insremot.csd) and [insremotM.csd](../examples/insremotM.csd).

``` csound-csd title="Examples of the insremot opcode." linenums="1"
--8<-- "examples/insremot.csd"
```

``` csound-csd linenums="1"
--8<-- "examples/insremotM.csd"
```

## See also

[Remote Opcodes](../oscnetwork/Remote.md)

## Credits

Author: Simon Schampijer<br>
2006<br>

New in version 5.03
