<!--
id:OSCbundle
category:OSC
-->
# OSCbundle
Sends data to other processes using the OSC protocol by packing messages in a bundle.

Unlike OSCsend, it can be used to send multiple messages at the same time, but only standard OSC numeric types are allowed.

## Syntax
=== "Modern"
    ``` csound-orc
    OSCbundle(kwhen, ihost, iport, Sdest[], Stype[], kArgs[][] [, isize])
    ```

=== "Classic"
    ``` csound-orc
    OSCbundle kwhen, ihost, iport, Sdest[], Stype[], kArgs[][] [, isize]
    ```

### Initialization

_ihost_ -- a string that is the intended host computer domain name.  An empty string is interpreted as the current computer.

_iport_ -- the number of the port that is used for the communication.

_isize_ -- maximum packet size in bytes, defaults to 65536.

### Performance

_kwhen_ -- a bundle of messages is sent whenever this value changes.  A message will always be sent on the first call.

_ Sdest[]_ -- an array of strings containing the destination address for each message. Length must agree with Stype[].

_Stype[]_ -- an array of strings containing the types for each message. Only numeric types ('i' for integers and 'f' for floats) are supported. Length must agree with Sdest[].

_kArg[][]_ -- a two-dimensional array containing the arguments for each message. Its dimension 1 (number of rows) must agree with Sdest[] and Stype[]. Its dimension 2 (number of columns) must be large enough to accommodate the message with the largest number of arguments. Each row should contain the arguments for the types of each message. If a row contains fewer arguments, any remaining data items are filled with zeros. Arguments in excess of what each type string requires are ignored.

### Examples

Here is an example of the OSCBundle opcode. It uses the file [oscbundle.csd](../examples/oscbundle.csd).

``` csound-csd title="Example of the OSCbundle opcode." linenums="1"
--8<-- "examples/oscbundle.csd"
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: Victor Lazzarini<br>
2018<br>
