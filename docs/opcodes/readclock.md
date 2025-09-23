<!--
id:readclock
category:Instrument Control:Time Reading
-->
# readclock
Reads the value of an internal clock.

## Syntax
=== "Modern"
    ``` csound-orc
    ir = readclock(inum)
    ```

=== "Classic"
    ``` csound-orc
    ir readclock inum
    ```

### Initialization

_inum_ -- the number of a clock.  There are 32 clocks numbered 0 through 31. All other values are mapped to clock number 32.

_ir_ -- value at i-time, of the clock specified by _inum_

### Performance

Between a [clockon](../opcodes/clockon.md) and a [clockoff](../opcodes/clockoff.md) opcode, the CPU time used is accumulated in the clock. The precision is machine dependent but is the millisecond range on UNIX and Windows systems. The _readclock_ opcde reads the current value of a clock at initialization time.

## Examples

Here is an example of the readclock opcode. It uses the file [readclock.csd](../examples/readclock.csd).

``` csound-csd title="Example of the readclock opcode." linenums="1"
--8<-- "examples/readclock.csd"
```

Its output should include lines like this:

```
instr 1:  i1 = 0.000
instr 1:  i1 = 90.000
instr 1:  i1 = 180.000
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
July, 1999<br>

Example written by Kevin Conder.

New in Csound version 3.56
