<!--
id:butterhp
category:Signal Modifiers:Standard Filters
-->
# butterhp
A high-pass Butterworth filter.

Implementation of second-order high-pass Butterworth filter. This opcode can also be written as [buthp](../opcodes/buthp.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = butterhp(asig, kfreq [, iskip])
    ares = butterhp(asig, afreq [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares butterhp asig, kfreq [, iskip]
    ares butterhp asig, afreq [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- Skip initialization if present and non-zero.

### Performance

These filters are Butterworth second-order IIR filters. They are slightly slower than the original filters in Csound, but they offer an almost flat passband and very good precision and stopband attenuation.

_asig_ -- Input signal to be filtered.

_kfreq_/_afreq_ -- Cutoff or center frequency for each of the filters.

## Examples

=== "Modern"
    Here is an example of the butterhp opcode. It uses the file [butterhp-modern.csd](../examples/butterhp-modern.csd).
    ``` csound-csd title="Example of the butterhp opcode." linenums="1"
    --8<-- "examples/butterhp-modern.csd"
    ```

=== "Classic"
    Here is an example of the butterhp opcode. It uses the file [butterhp.csd](../examples/butterhp.csd).
    ``` csound-csd title="Example of the butterhp opcode." linenums="1"
    --8<-- "examples/butterhp.csd"
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
