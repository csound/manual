<!--
id:cntCycles
category:Instrument Control:Sensing and Control
-->
# cntcycles
Get the number of times a counter has cycled.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *cntCycles*.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntcycles(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval cntCycles icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntcreate_.

### Performance

Counts the number of times a counter has been restarted.

_kval_ -- returned value.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
