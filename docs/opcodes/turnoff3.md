<!--
id:turnoff3
category:Instrument Control:Duration Control
-->
# turnoff3
Turn off instance(s) of other instruments at performance time in the queue of scheduled events.

## Syntax
=== "Modern"
    ``` csound-orc
    turnoff3(kinsno)
    ```

=== "Classic"
    ``` csound-orc
    turnoff3 kinsno
    ```

### Performance

_kinsno_ -- instrument to be turned off (can be fractional) if zero or negative, no instrument is turned off

## Examples

The following example uses the turnoff3 opcode.

``` csound-csd title="Example of the turnoff3 opcode." linenums="1"
--8<-- "examples/turnoff3.csd"
```

## See also

[Duration Control Statements](../control/durctl.md)

## Credits

Author: John ffitch<br>
2020<br>

New in Csound 6.16
