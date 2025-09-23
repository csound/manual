<!--
id:butterbr
category:Signal Modifiers:Standard Filters
-->
# butterbr
A band-reject Butterworth filter.

Implementation of a second-order band-reject Butterworth filter. This opcode can also be written as [butbr](../opcodes/butbr.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = butterbr(asig, xfreq, xband [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares butterbr asig, xfreq, xband [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- Skip initialization if present and non-zero.

### Performance

These filters are Butterworth second-order IIR filters. They are slightly slower than the original filters in Csound, but they offer an almost flat passband and very good precision and stopband attenuation.

_asig_ -- Input signal to be filtered.

_xfreq_ -- Cutoff or center frequency for each of the filters.

_xband_ -- Bandwidth of the bandpass and bandreject filters.

## Examples

=== "Modern"
    Here is an example of the butterbr opcode. It uses the file [butterbr-modern.csd](../examples/butterbr-modern.csd).
    ``` csound-csd title="Example of the butterbr opcode." linenums="1"
    --8<-- "examples/butterbr-modern.csd"
    ```

=== "Classic"
    Here is an example of the butterbr opcode. It uses the file [butterbr.csd](../examples/butterbr.csd).
    ``` csound-csd title="Example of the butterbr opcode." linenums="1"
    --8<-- "examples/butterbr.csd"
    ```

## See also

[Standard filters: Butterworth filters](../sigmod/standard.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

Existed in 3.30

Audio rate parameters introduced in version 6.02

October 2013.
