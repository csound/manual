<!--
id:cntReset
category:Instrument Control:Sensing and Control
-->
# cntreset
Resets a counter object to its initial state.

> :warning: **Deprecated alias**
>
> `cntReset` is a deprecated alias of `cntreset` in Csound 7. Use `cntreset` in new code. The old name still works for compatibility.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    cntreset(icnt)
    ```

=== "Classic"
    ``` csound-orc
    cntReset icnt
    ```

### Initialization

_icnt_ -- a handle for the counter.

### Performance

Resets a counter object.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch June 2020

New in version 6.15
