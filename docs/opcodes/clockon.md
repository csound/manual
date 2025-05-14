<!--
id:clockon
category:Instrument Control:Clock Control
-->
# clockon
Starts one of a number of internal clocks.

## Syntax
=== "Modern"
    ``` csound-orc
    clockon(inum)
    ```

=== "Classic"
    ``` csound-orc
    clockon inum
    ```

### Initialization

_inum_ -- the number of a clock.  There are 32 clocks numbered 0 through 31. All other values are mapped to clock number 32.

### Performance

Between a _clockon_ and a [clockoff](../opcodes/clockoff.md) opcode, the CPU time used is accumulated in the clock. The precision is machine dependent but is the millisecond range on UNIX and Windows systems. The [readclock](../opcodes/readclock.md) opcode reads the current value of a clock at initialization time.

## Examples

=== "Modern"
    Here is an example of the clockon opcode. It uses the file [clockon-modern.csd](../examples/clockon-modern.csd).
    ``` csound-csd title="Example of the clockon opcode." linenums="1"
    --8<-- "examples/clockon-modern.csd"
    ```

=== "Classic"
    Here is an example of the clockon opcode. It uses the file [clockon.csd](../examples/clockon.csd).
    ``` csound-csd title="Example of the clockon opcode." linenums="1"
    --8<-- "examples/clockon.csd"
    ```

## See also

[Clock Control](../control/clockctl.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
July, 1999<br>

New in Csound version 3.56
