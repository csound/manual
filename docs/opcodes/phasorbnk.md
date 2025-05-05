<!--
id:phasorbnk
category:Signal Generators:Phasors
-->
# phasorbnk
Produce an arbitrary number of normalized moving phase values, accessable by an index.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = phasorbnk(xcps, kndx, icnt [, iphs])
    kres = phasorbnk(kcps, kndx, icnt [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares phasorbnk xcps, kndx, icnt [, iphs]
    kres phasorbnk kcps, kndx, icnt [, iphs]
    ```

### Initialization

_icnt_ -- maximum number of phasors to be used.

_iphs_ -- initial phase, expressed as a fraction of a cycle (0 to 1). If -1 initialization is skipped. If _iphas_&gt;1 each phasor will be initialized with a random value.

### Performance

_kndx_ -- index value to access individual phasors

For each independent phasor, an internal phase is successively accumulated in accordance with the _kcps_ or _xcps_ frequency to produce a moving phase value, normalized to lie in the range 0 &lt;= phs &lt; 1. Each individual phasor is accessed by index _kndx_.

This phasor bank can be used inside a k-rate loop to generate multiple independent voices, or together with the [adsynt](../opcodes/adsynt.md) opcode to change parameters in the tables used by _adsynt_.

## Examples

Here is an example of the phasorbnk opcode. It uses the file [phasorbnk.csd](../examples/phasorbnk.csd).

``` csound-orc title="Example of the phasorbnk opcode." linenums="1"
--8<-- "examples/phasorbnk.csd"
```

Generate multiple voices with independent partials. This example is better with _adsynt_. See also the example under [adsynt](../opcodes/adsynt.md), for k-rate use of _phasorbnk_.

## See also

[Phasors](../siggen/phasors.md)

## Credits

Author: Peter Neub&auml;cker<br>
Munich, Germany<br>
August 1999<br>

New in Csound version 3.58
