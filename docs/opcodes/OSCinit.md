<!--
id:OSCinit
category:OSC
-->
# oscinit
Start a listening process for OSC messages to a particular port.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *OSCinit*.

Plugin opcode in osc.

This listening process can be used by *osclisten*.

## Syntax
=== "Modern"
    ``` csound-orc
    ihandle = oscinit(iport)
    ```

=== "Classic"
    ``` csound-orc
    ihandle OSCinit iport
    ```

### Initialization

_ihandle_ -- handle returned that can be passed to any number of *osclisten* opcodes to receive messages on this port.

_iport_ -- the port on which to listen.

### Performance

The listener runs in the background.  See *osclisten* for details.

## Examples

The example shows a pair of floating point numbers being received on port 7770.

``` csound-orc
sr = 44100
ksmps = 100
nchnls = 2

handle@global:i = oscinit(7770)

instr 1
  f1:k = init(0)
  f2:k = init(0)
nxtmsg:
  kk = osclisten(handle, "/foo/bar", "ff", f1, f2)
  if (kk == 0) goto ex
    printk(0, f1)
    printk(0, f2)
    kgoto(nxtmsg)
ex:
  endin

```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch<br>
2005<br>
