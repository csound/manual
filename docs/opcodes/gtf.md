<!--
id:gtf
category:Signal Modifiers:Specialized Filters
-->
# gtf
Apply a gammatone filter of various orders to an audio signal.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = gtf(ain, kfreq, idecay[, iorder, iphase])
    ```

=== "Classic"
    ``` csound-orc
    aout gtf ain, kfreq, idecay[, iorder, iphase]
    ```

### Initialization

_idecay_ -- rate of decay

_iorder_ -- (optional) Order of filter in rangs 1 to 10 defaulting to 4.

_iphase_ -- (optional) Phase output, defaulting to zero.

### Performance

_asig_ -- audio signal to be filtered.

_kfreq_ -- central frequency of filter in Hertz.

The gammatone filter is commonly used in models of the auditory system. The algorithm is based on Martin Cooke's Ph.D work (Cooke, 1993) using the base-band impulse invariant transformation.   See [http://staffwww.dcs.shef.ac.uk/people/N.Ma/resources/gammatone/](http://staffwww.dcs.shef.ac.uk/people/N.Ma/resources/gammatone/)

## Examples

Here is an example of the gtf opcode. It uses the file [gtf.csd](../examples/gtf.csd).

``` csound-csd title="Example of the gtf opcode." linenums="1"
--8<-- "examples/gtf.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

By: John ffitch 2019
