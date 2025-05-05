<!--
id:OSCsend
category:OSC
-->
# OSCsend
Sends data to other listening processes using the OSC protocol.

## Syntax
=== "Modern"
    ``` csound-orc
    OSCsend(kwhen, ihost, iport, idestination [, itype , xdata1, xdata2, ...])
    ```

=== "Classic"
    ``` csound-orc
    OSCsend kwhen, ihost, iport, idestination [, itype , xdata1, xdata2, ...]
    ```

### Initialization

_ihost_ -- a string that is the intended host computer domain name.  An empty string is interpreted as the current computer.

_iport_ -- the number of the port that is used for the communication.

_idestination_ -- a string that is the destination address.  This takes the form of a file name with directories.  Csound just passes this string to the raw sending code and makes no interpretation.

_itype_ -- a string that indicates the types of the optional arguments that are read at k-rate.  The string can contain the characters "abcdfilmstAG" which stand for audio, Boolean, character, double, float, 32-bit integer, 64-bit integer, MIDI, string, timestamp, k-rate array and ftable. The OSC message may not have any types, in which case, it will consist only of the destination address.

### Performance

_kwhen_ -- a message is sent whenever this value changes.  A message will always be sent on the first call.

The data is taken from the k-values or a-value that follow the format string.   In a similar way to a printf format, the characters in order determine how the argument is interpreted.  Note that a time stamp takes two arguments.

## Examples

The example shows a simple instrument, which when called, sends a group of 3 messages to a computer called "xenakis", on port 7770, to be read by a process that recognises /foo/bar as its address.

``` csound-orc
      instr   1
          OSCsend     1, "xenakis.cs.bath.ac.uk",7770, "/foo/bar", "sis", "FOO", 42, "bar"
      endin
```

Here is a complete example of the OSCsend opcode. It uses the file [OSCsend.csd](../examples/OSCsend.csd).

``` csound-csd title="Example of the OSCsend opcode." linenums="1"
--8<-- "examples/OSCsend.csd"
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch<br>
2005<br>

Data types a, A and G were added in 6.07; they send data via blobs and are only really useful to other Csound instances or custom listeners.
