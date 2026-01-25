<!--
id:cntDelete_i
category:Instrument Control:Sensing and Control
-->
# cntdeletei
Delete a counter.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *cntDelete_i*.

Plugin opcode in counter and render any memory used.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = cntdeletei(icnt)
    ```

=== "Classic"
    ``` csound-orc
    ival cntDelete_i icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntcreate_.

### Performance

_ival_ -- the handle deleted or a negative number if there was no such counter.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch August 2020

New in version 6.16
