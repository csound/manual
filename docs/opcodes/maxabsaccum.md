<!--
id:maxabsaccum
category:Signal Modifiers:Comparators and Accumulators
-->
# maxabsaccum
Accumulates the maximum of the absolute values of audio signals.

_maxabsaccum_ compares two audio-rate variables and stores the maximum of their absolute values into the first.

## Syntax
=== "Modern"
    ``` csound-orc
    maxabsaccum(aAccumulator, aInput)
    ```

=== "Classic"
    ``` csound-orc
    maxabsaccum aAccumulator, aInput
    ```

### Performance

_aAccumulator_ -- audio variable to store the maximum value

_aInput_ -- signal that aAccumulator is compared to

The _maxabsaccum_ opcode is designed to accumulate the maximum value from among many audio signals that may be in different note instances, different channels, or otherwise cannot all be compared at once using the _maxabs_ opcode.  _maxabsaccum_ is identical to _maxaccum_ except that it takes the absolute value of aInput before the comparison.  Its semantics are similar to _vincr_ since _aAccumulator_ is used as both an input and an output variable, except that _maxabsaccum_ keeps the maximum absolute value instead of adding the signals together.  _maxabsaccum_ performs the following operation on each pair of samples:

```
if  (abs(aInput) > aAccumulator)  aAccumulator = abs(aInput)
```

_aAccumulator_ will usually be a global audio variable.  At the end of any given computation cycle (k-period), after its value is read and used in some way, the accumulator variable should usually be reset to zero  (perhaps by using the _clear_ opcode).  Clearing to zero is sufficient for _maxabsaccum_, unlike the _maxaccum_ opcode.

## Examples

Here is an example of the maxabsaccum opcode. It uses the file [maxabsaccum.csd](../examples/maxabsaccum.csd).

``` csound-csd title="Example of the maxabsaccum opcode." linenums="1"
--8<-- "examples/maxabsaccum.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
