<!--
id:GENdeconv
category:
-->
# GENdeconv
Generates a table with an impulse response by applying the
deconvolution of a sweep and impulse response measurement (s).

## Syntax
``` csound-orc
f # time size "deconv" sweepfn inputfn1 [inputfn2 ...]
```

### Initialization

_size_ -- number of points in the table. Must be a power of 2 or power-of-2 plus 1 (see [f statement](../scoregens/f.md)).

_fnsf_ -- source table holding sine sweep data used in measurement

_inputfn1_ -- source table holding impulse response
measurement. Multiple tables can be used for multichannel measurement,
producing an interleaved IR table.


## Examples

Here is an example of the GENwave routine. It uses the file [gendeconv.csd](../examples/gendeconv.csd).

``` csound-csd title="Example of the GENdeconv routine." linenums="1"
--8<-- "examples/gendeconv.csd"
```

## Credits

Written by Victor Lazzarini

Maynooth University Ireland

2026
