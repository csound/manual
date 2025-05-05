<!--
id:cntState
category:Instrument Control:Sensing and Control
-->
# cntState
Gives the range and increment of a counter.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kmax, kmin, kinc = cntState(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kmax, kmin, kinc cntState icnt
    ```

### Initialization

_icnt_ -- a handle for the counter.

### Performance

kmax, kmin, kinc -- arguments to the original creation

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
