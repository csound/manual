<!--
id:phasor
category:Signal Generators:Phasors
-->
# phasor
Produce a normalized moving phase value.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = phasor(xcps [, iphs])
    kres = phasor(kcps [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares phasor xcps [, iphs]
    kres phasor kcps [, iphs]
    ```

### Initialization

_iphs_ (optional) -- initial phase, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is zero.

### Performance

An internal phase is successively accumulated in accordance with the _kcps_ or _xcps_ frequency to produce a moving phase value, normalized to lie in the range 0 &lt;= phs &lt; 1.

When used as the index to a [table](../opcodes/table.md) unit, this phase (multiplied by the desired function table length) will cause it to behave like an oscillator.

Note that _phasor_ is a special kind of integrator, accumulating phase increments that represent frequency settings.

## Examples

Here is an example of the phasor opcode. It uses the file [phasor.csd](../examples/phasor.csd).

``` csound-orc title="Example of the phasor opcode." linenums="1"
--8<-- "examples/phasor.csd"
```

A musical example featuring the phasor opcode: [PhasorTablei_Cucchi.csd](../examples/musical/PhasorTablei_Cucchi.csd) by Stefano Cucchi.

## See also

[Phasors](../siggen/phasors.md)
