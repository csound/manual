<!--
id:tbvcf
category:Signal Modifiers:Standard Filters:Resonant
-->
# tbvcf
Models some of the filter characteristics of a Roland TB303 voltage-controlled filter.

Euler's method is used to approximate the system, rather than traditional filter methods. Cutoff frequency, Q, and distortion are all coupled. Empirical methods were used to try to unentwine,  but frequency is only approximate as a result. Future fixes for some problems with this opcode may break existing orchestras relying on this version of _tbvcf_.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tbvcf(asig, xfco, xres, kdist, kasym [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares tbvcf asig, xfco, xres, kdist, kasym [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_asig_ -- input signal. Should be normalized to &plusmn;1.

_xfco_ -- filter cutoff frequency. Optimum range is 10,000 to 1500. Values below 1000 may cause problems.

_xres_ -- resonance or Q. Typically in the range 0 to 2.

_kdist_ -- amount of distortion. Typical value is 2. Changing _kdist_ significantly from 2 may cause odd interaction with _xfco_ and _xres_.

_kasym_ -- asymmetry of resonance. Typically in the range 0 to 1.

## Examples

Here is an example of the tbvcf opcode. It uses the file [tbvcf.csd](../examples/tbvcf.csd).

``` csound-csd title="Example of the tbvcf opcode." linenums="1"
--8<-- "examples/tbvcf.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Hans Mikelson<br>
December, 2000 -- January, 2001<br>

New in Csound 4.10
