<!--
id:cntCycles
category:Instrument Control:Sensing and Control
-->
# cntCycles
Get the number of times a counter has cycled.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntCycles(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval cntCycles icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntCreate_.

### Performance

Counts the number of times a counter has been restarted.

_kval_ -- returned value.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
