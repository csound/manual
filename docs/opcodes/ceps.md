<!--
id:ceps
category:Array Operations: Cepstrum
-->
# ceps
Calculate the cepstrum of an array input, optionally filtering coefficients.

## Syntax
``` csound-orc
keps[] ceps kmags[] [, icoefs]
```

### Initialization

_icoefs_ -- the number of retained coefficients in the cepstrum output. By default, no coefficients are filtered.

### Performance

_keps[]_ -- the cepstrum output, an array of size N+1, where N is a power of two.

_kmags[]_ -- an input array containing N+1 magnitudes.

## Examples

Here is an example of the use of the _ceps_ opcode. It uses the file [ceps.csd](../../examples/ceps.csd).

``` csound-csd title="Example of the _ceps_ opcode." linenums="1"
--8<-- "examples/ceps.csd"
```

## See Also

[Array-based spectral opcodes](../../spectral/arrays)

## Credits

Author: Victor Lazzarini<br>
2014<br>
