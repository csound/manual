<!--
id:OSCcount
category:OSC
-->
# OSCcount
Gives the Count of OSC messages currently unread but received by the current listeners.

Plugin opcode in osc.

## Syntax
=== "Modern"
    ``` csound-orc
    kans = OSCcount()
    ```

=== "Classic"
    ``` csound-orc
    kans OSCcount
    ```

### Performance

_kans_ -- set to the number of messages accepted by this Csound process to any address but not yet presented to a call of OSClisten.

The expected use of this opcode is when there are a number of listeners and we can decide checking them all if there are no messages.

## Examples

This example shows a pair of floating point numbers being received on port 7770.

``` csound-orc
  sr = 44100
  ksmps = 100
  nchnls = 2

  gihandle OSCinit 7770

  instr   1
    kf1 init 0
    kf2 init 0
    kk  OSCcount
nxtmsg:

if (kk == 0) goto ex
  kr  OSClisten gihandle, "/foo/bar", "ff", kf1, kf2
    printk 0,kf1
    printk 0,kf2
    kk -= 1
    kgoto nxtmsg
ex:
  endin
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch<br>
2018 new in Csound 6.12<br>
