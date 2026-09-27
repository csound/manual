<!--
id:OSCsend_lo
category:OSC
-->
# OSCsend_lo
Sends OSC messages using the older name for oscsendlo.

`OSCsend_lo` is a deprecated alias of [oscsendlo](oscsendlo.md). It has the same arguments, liblo build requirements and behavior. Use `oscsendlo` in new code.

## Syntax

=== "Modern"
    ``` csound-orc
    OSCsend_lo(kwhen, Shost, kport, Spath [, Stypes, xdata1, xdata2, ...])
    ```

=== "Classic"
    ``` csound-orc
    OSCsend_lo kwhen, Shost, kport, Spath [, Stypes, xdata1, xdata2, ...]
    ```

See [oscsendlo](oscsendlo.md) for the argument descriptions, supported types and example. `OSCsend`, without `_lo`, is an alias of the separate [oscsend](OSCsend.md) opcode.

## Credits

Author John ffitch, 2005.
