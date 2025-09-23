<!--
id:vlinseg
category:Vectorial:Envelopes
-->
# vlinseg
Vectorial envelope generator. Generate linear vectorial segments.

## Syntax
=== "Modern"
    ``` csound-orc
    vlinseg(ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]])
    ```

=== "Classic"
    ``` csound-orc
    vlinseg ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]]
    ```

### Initialization

_ifnout_  - number of table hosting output vectorial signal

_ifn1_ - starting vector

_ifn2,ifn3,etc._ - vector after _idurx_ seconds

_idur1_ - duration in seconds of first segment.

_idur2, idur3, etc. _ - duration in seconds of subsequent segments.

_ielements_ - number of elements of vectors.

### Performance

These opcodes are similar to _linseg_ and _expseg_, but operate with vectorial signals instead of with scalar signals.

Output is a vectorial control signal hosted by _ifnout_ (that must be previously allocated), while each break-point of the envelope is actually a vector of values. All break-points must contain the same number of elements (_ielements_).

All these operators are designed to be used together with other opcodes that operate with vectorial signals such as _vcella_, _adsynt_, _adsynt2_, etc.

## Examples

Here is an example of the vlinseg opcode. It uses the files [vlinseg.csd](../examples/vlinseg.csd).

``` csound-csd title="Example of the vlinseg opcode." linenums="1"
--8<-- "examples/vlinseg.csd"
```

## See also

[Vectorial Envelope Generators](../vectorial/envelopeGenerators.md)

## Credits

Written by Gabriel Maldonado.

Example by Andres Cabrera.

New in Csound 5 (Previously available only on CsoundAV)
