<!--
id:minaccum
category:Signal Modifiers:Comparators and Accumulators
-->
# minaccum
Accumulates the minimum value of audio signals.

_minaccum_ compares two audio-rate variables and stores the minimum value between them into the first.

## Syntax
=== "Modern"
    ``` csound-orc
    minaccum(aAccumulator, aInput)
    ```

=== "Classic"
    ``` csound-orc
    minaccum aAccumulator, aInput
    ```

### Performance

_aAccumulator_ -- audio variable to store the minimum value

_aInput_ -- signal that aAccumulator is compared to

The _minaccum_ opcode is designed to accumulate the minimum value from among many audio signals that may be in different note instances, different channels, or otherwise cannot all be compared at once using the _min_ opcode.  Its semantics are similar to _vincr_ since _aAccumulator_ is used as both an input and an output variable, except that _minaccum_ keeps the minimum value instead of adding the signals together.  _minaccum_ performs the following operation on each pair of samples:

```
if  (aInput &lt; aAccumulator)  aAccumulator = aInput
```

_aAccumulator_ will usually be a global audio variable.  At the end of any given computation cycle (k-period), after its value is read and used in some way, the accumulator variable should usually be reset to some large enough positive value that will always be greater than the input signals to which it is compared.

## Examples

Here is an example of the minaccum opcode. It uses the file [minaccum.csd](../examples/minaccum.csd).

``` csound-csd title="Example of the minaccum opcode." linenums="1"
--8<-- "examples/minaccum.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
