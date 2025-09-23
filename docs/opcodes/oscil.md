<!--
id:oscil
category:Signal Generators:Basic Oscillators
-->
# oscil
A simple oscillator without any interpolation.

_oscil_ reads table _ifn_ sequentially and repeatedly at a frequency _xcps_. The amplitude is scaled by _xamp_.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = oscil(xamp, xcps [, ifn, iphs])
    kres = oscil(kamp, kcps [, ifn, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares oscil xamp, xcps [, ifn, iphs]
    kres oscil kamp, kcps [, ifn, iphs]
    ```

### Initialization

_ifn_ -- (optional) function table
number. Requires a wrap-around guard point. The table number
defaults to -1 which indicates a sinewave.

_iphs_ (optional, default=0) -- initial phase of sampling, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is 0.

### Performance

_kamp, xamp_ -- amplitude

_kcps, xcps_ -- frequency in cycles per second.

The _oscil_ opcode generates periodic control (or audio) signals consisting of the value of _kamp_ (_xamp_) times the value returned from control rate (audio rate) sampling of a stored function table. The internal phase is simultaneously advanced in accordance with the _kcps_ or _xcps_ input value.

Table _ifn_ is incrementally sampled modulo the table length and the value obtained is multiplied by _amp_.

If you need to change the oscillator table with a k-rate signal, you can use [oscilikt](../opcodes/oscilikt.md).

> :memo: **Note**<br>
>
> This opcode does not perform any interpolation. This can lead to unexpected behaviour or unclean signals, e.g. for small table sizes and low frequencies. As standard oscillators the usage of [oscili](../opcodes/oscili.md) or [poscil](../opcodes/poscil.md) is recommended.

## Examples

Here is an example of the oscil opcode. It uses the file [oscil.csd](../examples/oscil.csd).

``` csound-orc title="Example of the oscil opcode." linenums="1"
--8<-- "examples/oscil.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)
