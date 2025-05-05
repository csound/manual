<!--
id:cntDelete
category:Instrument Control:Sensing and Control
-->
# cntDelete
Delete a counter and render any memory used.

Plugin opcode in counter.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = cntDelete(icnt)
    ```

=== "Classic"
    ``` csound-orc
    kval cntDelete icnt
    ```

### Initialization

_icnt_ -- the handle of a counter object from a call to _cntCreate_.

### Performance

_kval_ -- the handle deleted or a negative number if there was no such counter.

## See also

[Program Flow Control: Counter](../control/pgmctl.md)

## Credits

By: John ffitch August 2020

New in version 6.16
