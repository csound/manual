<!--
id:cmp
category:Signal Modifiers:Comparators and Accumulators
-->
# cmp
Compares audio signals or arrays.

Plugin opcode in emugens.

Compares audio signals or arrays, sample by sample or value by value. All comparison operations are possible: &lt;, &lt;=, >, >=, ==, !=

An audio signal can be compared against another audio signal, or against a scalar (i- or k-value).

``` csound-orc
aOut cmp aL, ">", aR
aOut cmp aIn, ">=", 0.5
aOut cmp aIn, "<=", kthreshold
```

An array can be compared against another array, against a scalar, or checked to be within the range of two scalars. All operations are available for i- and k- arrays

``` csound-orc
kOut[] cmp kIn[], ">=", kx
kOut[] cmp kA[], "==", kB[]
kOut[] cmp 0.5, "<", kIn[], "<=", 1
```

## Syntax
=== "Modern"
    ``` csound-orc
    aout = cmp(a1, S_operator, a2)
    aout = cmp(a1, S_operator, kb)
    kOut[] = cmp(kA[], S_operator, kb)
    kOut[] = cmp(kA[], S_operator, kB[])
    kOut[] = cmp(k1, S_operator1, kIn[], S_operator2, k2)
    ```

=== "Classic"
    ``` csound-orc
    aout cmp a1, S_operator, a2
    aout cmp a1, S_operator, kb
    kOut[] cmp kA[], S_operator, kb
    kOut[] cmp kA[], S_operator, kB[]
    kOut[] cmp k1, S_operator1, kIn[], S_operator2, k2
    ```

### Initialization

_S\_operator_ -- Math operator, one of ">", ">=", "<", "<=", "=="

### Performance

_a1 / a2_ -- Input signals

_kb / ib_ -- Scalar term

_kA[] / kB[]_ -- array inputs

Some example usages:

``` csound-orc
aout cmp aL, ">", aR      ; aout = aL > aR for every sample
aout cmp aL, ">=", aR
aout cmp aL, "<", aR
aout cmp aL, "<", aR
aout cmp aL, "==", aR
kOut[] cmp kA, ">=", kb   ; kA is an array
```

## Examples

Here is an example of the cmp opcode. It uses the file [cmp.csd](../examples/cmp.csd).

``` csound-csd title="Example of the cmp opcode." linenums="1"
--8<-- "examples/cmp.csd"
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

[Comparators and Accumulators](../sigmod/compaccum.md)

[Array opcodes](../math/array.md)

## Credits

By: Eduardo Moguillansky 2017
