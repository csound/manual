<!--
id:oscil3
category:Signal Generators:Basic Oscillators
-->
# oscil3
A simple oscillator with cubic interpolation.

_oscil3_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_. Cubic interpolation is applied for table look up from internal phase values.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = oscil3(xamp, xcps [, ifn, iphs])
    kres = oscil3(kamp, kcps [, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares oscil3 xamp, xcps [, ifn, iphs]
    kres oscil3 kamp, kcps [, ifn, iphs]
    ```

### Initialization

_ifn_ (optional) -- function table
number. Requires a wrap-around guard point.  Defaults to -1
indicating a sinewave.

_iphs_ (optional) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_kamp, xamp_ -- amplitude

_kcps, xcps_ -- frequency in cycles per second.

_oscil3_ is identical to [oscili](../opcodes/oscili.md), except that it uses cubic interpolation.

Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.

If you need to change the oscillator table with a k-rate signal, you can use [oscilikt](../opcodes/oscilikt.md).

## Examples

Here is an example of the oscil3 opcode. It uses the file [oscil3.csd](../examples/oscil3.csd).

``` csound-orc title="Example of the oscil3 opcode." linenums="1"
--8<-- "examples/oscil3.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: John ffitch

New in Csound version 3.50
