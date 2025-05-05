<!--
id:mpulse
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# mpulse
Generates a set of impulses.

The impulses have amplitude _kamp_ separated by _kintvl_ seconds (or samples if _kintvl_ is negative).  The first impulse is generated after a delay of _ioffset_ seconds.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = mpulse(kamp, kintvl [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    ares mpulse kamp, kintvl [, ioffset]
    ```

### Initialization

_ioffset_ (optional, default=0) -- the delay before the first impulse. If it is negative, the value is taken as the number of samples, otherwise it is in seconds. Default is zero.

### Performance

_kamp_ -- amplitude of the impulses generated

_kintvl_ -- Interval of time in seconds (or samples if _kintvl_ is negative) to the next pulse.

After the initial delay, an impulse of _kamp_ amplitude is generated as a single sample.  Immediately after generating the impulse, the time of the next one is determined from the value of _kintvl_ at that precise moment. This means that any changes in _kintvl_ between impulses are discarded. If _kintvl_ is zero, there is an infinite wait to the next impulse. If _kintvl_ is negative, the interval is counted in number of samples rather than seconds.

## Examples

Here is an example of the mpulse opcode. It uses the file [mpulse.csd](../examples/mpulse.csd).

``` csound-orc title="Example of the mpulse opcode." linenums="1"
--8<-- "examples/mpulse.csd"
```

Another example of how to use mpulse can be found here: [mode](../opcodes/mode.md)

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

Written by John ffitch.

New in version 4.08
