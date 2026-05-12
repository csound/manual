<!--
id:OSCcount
category:OSC
-->
# osccount
Gives the Count of OSC messages currently unread but received by the current listeners.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *OSCcount*.

Plugin opcode in osc.

## Syntax
=== "Modern"
    ``` csound-orc
    kans = osccount()
    ```

=== "Classic"
    ``` csound-orc
    kans OSCcount
    ```

### Performance

_kans_ -- set to the number of messages accepted by this Csound process to any address but not yet presented to a call of *osclisten*.

The expected use of this opcode is when there are a number of listeners and we can decide checking them all if there are no messages.

## Examples

This example shows a pair of floating point numbers being received on port 7770.

``` csound-orc
sr = 44100
ksmps = 100
nchnls = 2

handle@global:i = oscinit(7770)

instr 1
  f1:k = init(0)
  f2:k = init(0)
  kk = osccount()

  until (kk == 0) do
    kr = osclisten(handle, "/foo/bar", "ff", f1, f2)
    printk(0, f1)
    printk(0, f2)
    kk -= 1
  od
endin
```

## See also

[OSC (Open Sound Control)](../oscnetwork/OSC.md)

More information on this opcode: [http://www.youtube.com/watch?v=JX1C3TqP_9Y](http://www.youtube.com/watch?v=JX1C3TqP_9Y), made by Andrés Cabrera

## Credits

Author: John ffitch<br>
2018 new in Csound 6.12<br>
