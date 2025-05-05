<!--
id:midremot
category:Remote Opcodes
-->
# midremot
An opcode which can be used to implement a remote midi orchestra. This opcode will send midi events from a source machine to one destination.

With the _midremot_ and [midglobal](../opcodes/midglobal.md) opcodes you are able to perform instruments on remote machines and control them from a master machine. The remote opcodes are implemented using the master/client model. All the machines involved contain the same orchestra but only the master machine contains the information of the midi score. During the performance the master machine sends the midi events to the clients. The _midremot_ opcode will send events from a source machine to one destination if you want to send events to many destinations (broadcast) use the [midglobal](../opcodes/midglobal.md) opcode instead. These two opcodes can be used in combination.

## Syntax
=== "Modern"
    ``` csound-orc
    midremot(idestination, isource, instrnum [, instrnum...])
    ```

=== "Classic"
    ``` csound-orc
    midremot idestination, isource, instrnum [, instrnum...]
    ```

### Initialization

_idestination_ -- a string that is the intended host computer (e.g. 192.168.0.100). This is the destination host which receives the events from the given instrument.

_isource_ -- a string that is the intended host computer (e.g. 192.168.0.100). This is the source host which generates the events of the given instrument and sends it to the address given by idestination.

_instrnum_ -- a list of instrument numbers which will be played on the destination machine

## Examples

Here is an example of the midremot opcode. It uses the files [insremot.csd](../examples/midremot.csd).

``` csound-csd title="Example of the insremot opcode." linenums="1"
--8<-- "examples/midremot.csd"
```

## See also

[Remote Opcodes](../oscnetwork/Remote.md)

## Credits

Author: Simon Schampijer<br>
2006<br>

New in version 5.03
