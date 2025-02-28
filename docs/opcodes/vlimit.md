<!--
id:vlimit
category:Vectorial:Limiting and Wrapping
-->
# vlimit
Limits elements of vectorial control signals.

## Syntax
``` csound-orc
vlimit  ifn, kmin, kmax, ielements
```

### Initialization

_ifn_  - number of the table hosting the vector to be processed

_ielements_ - number of elements of the vector

### Performance

_kmin_  - minimum threshold value

_kmax_  - maximum threshold value

_vlimit_ set lower and upper limits on each element of the vector they process.

These opcodes are similar to [limit](../../opcodes/limit), [wrap](../../opcodes/wrap) and [mirror](../../opcodes/mirror), but operate with a vectorial signal instead of with a scalar signal.

Result overrides old values of _ifn1_, if these are out of min/max interval. If you want to keep input vector, use [vcopy](../../opcodes/vcopy) opcode to copy it in another table.

All these opcodes are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../../opcodes/vcella), [adsynt](../../opcodes/adsynt), [adsynt2](../../opcodes/adsynt2) etc.

## See also

[Limiting and wrapping of vectorial control signals](../../vectorial/limiting)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
