<!--
id:cntRead
category:Instrument Control:Sensing and Control
-->
# cntRead
Read current value of a counter object without changing it.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntRead(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval cntRead icnt
    ```

### Initialization

_icnt_ -- a handle for the counter.

### Performance

Reads a counter object.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
