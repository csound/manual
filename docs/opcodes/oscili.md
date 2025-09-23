<!--
id:oscili
category:Signal Generators:Basic Oscillators
-->
# oscili
A simple oscillator with linear interpolation.

_oscili_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_. Linear interpolation is applied for table look up from internal phase values.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = oscili(xamp, xcps[, ifn, iphs])
    kres = oscili(kamp, kcps[, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares oscili xamp, xcps[, ifn, iphs]
    kres oscili kamp, kcps[, ifn, iphs]
    ```

### Initialization

_ifn_(optional) -- function table number. Requires a wrap-around guard point. The table number defaults to -1 which indicates a sine wave.

_iphs_ (optional) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_kamp, xamp_ -- amplitude

_kcps, xcps_ -- frequency in cycles per second.

_oscili_ differs from [oscil](../opcodes/oscil.md) in that the standard procedure of using a truncated phase as a sampling index is here replaced by a process that interpolates between two successive lookups. Interpolating generators will produce a noticeably cleaner output signal, but they may take as much as twice as long to run. Adequate accuracy can also be gained without the time cost of interpolation by using large stored function tables of 2K, 4K or 8K points if the space is available.

Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.

If you need to change the oscillator table with a k-rate signal, you can use [oscilikt](../opcodes/oscilikt.md).

## Examples

Here is an example of the oscili opcode. It uses the file [oscili.csd](../examples/oscili.csd).

``` csound-orc title="Example of the oscili opcode." linenums="1"
--8<-- "examples/oscili.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)
