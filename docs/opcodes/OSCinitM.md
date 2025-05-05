<!--
id:OSCinitM
category:OSC
-->
# OSCinitM
Start a multicast listening process to a particular port, which can be used by OSClisten.

Plugin opcode in osc.
## Syntax
=== "Modern"
    ``` csound-orc
    ihandle = OSCinitM(Sgroup, iport)
    ```

=== "Classic"
    ``` csound-orc
    ihandle OSCinitM Sgroup, iport
    ```

### Initialization

_Sgroup_ -- string giving the IP address of the multicast group.

_ihandle_ -- handle returned that can be passed to any number of OSClisten opcodes to receive messages on this port.

_iport_ -- the port on which to listen.

### Performance

The listener runs in the background.  See OSClisten for details.

## Examples

The example shows a pair of floating point numbers being received on port 7770.

``` csound-orc
sr = 44100
ksmps = 100
nchnls = 2

gihandle OSCinitM "225.0.0.1", 7770

  instr   1
    kf1 init 0
    kf2 init 0
nxtmsg:
    kk  OSClisten gihandle, "/foo/bar", "ff", kf1, kf2
if (kk == 0) goto ex
    printk 0,kf1
    printk 0,kf2
    kgoto nxtmsg
ex:
  endin
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch<br>
2016<br>
