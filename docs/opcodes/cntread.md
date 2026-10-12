<!--
id:cntRead
category:Instrument Control:Sensing and Control
-->
# cntread
Read current value of a counter object without changing it.

> :warning: **Deprecated alias**
>
> `cntRead` is a deprecated alias of `cntread` in Csound 7. Use `cntread` in new code. The old name still works for compatibility.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntread(icnt)
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
