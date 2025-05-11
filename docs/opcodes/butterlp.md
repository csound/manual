<!--
id:butterlp
category:Signal Modifiers:Standard Filters
-->
# butterlp
A low-pass Butterworth filter.

Implementation of a second-order low-pass Butterworth filter. This opcode can also be written as [butlp](../opcodes/butlp.md).

## Syntax
=== "Modern"
    ``` csound-orc
    ares = butterlp(asig, kfreq [, iskip])
    ares = butterlp(asig, afreq [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares butterlp asig, kfreq [, iskip]
    ares butterlp asig, afreq [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- Skip initialization if present and non-zero.

### Performance

These filters are Butterworth second-order IIR filters. They are slightly slower than the original filters in Csound, but they offer an almost flat passband and very good precision and stopband attenuation.

_asig_ -- Input signal to be filtered.

_kfreq_/_afreq_ -- Cutoff or center frequency for each of the filters.

## Examples

=== "Modern"
    Here is an example of the butterlp opcode. It uses the file [butterlp-modern.csd](../examples/butterlp-modern.csd).
    ``` csound-csd title="Example of the butterlp opcode." linenums="1"
    --8<-- "examples/butterlp-modern.csd"
    ```

=== "Classic"
    Here is an example of the butterlp opcode. It uses the file [butterlp.csd](../examples/butterlp.csd).
    ``` csound-csd title="Example of the butterlp opcode." linenums="1"
    --8<-- "examples/butterlp.csd"
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
