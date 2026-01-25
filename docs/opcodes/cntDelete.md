<!--
id:cntDelete
category:Instrument Control:Sensing and Control
-->
# cntdelete
Delete a counter and render any memory used.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *cntDelete*.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntdelete(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval cntDelete icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntcreate_.

### Performance

_kval_ -- the handle deleted or a negative number if there was no such counter.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch August 2020

New in version 6.16
