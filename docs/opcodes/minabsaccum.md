<!--
id:minabsaccum
category:Signal Modifiers:Comparators and Accumulators
-->
# minabsaccum
Accumulates the minimum of the absolute values of audio signals.

_minabsaccum_ compares two audio-rate variables and stores the minimum of their absolute values into the first.

## Syntax
=== "Modern"
    ``` csound-orc
    minabsaccum(aAccumulator, aInput)
    ```

=== "Classic"
    ``` csound-orc
    minabsaccum aAccumulator, aInput
    ```

### Performance

_aAccumulator_ -- audio variable to store the minimum value

_aInput_ -- signal that aAccumulator is compared to

The _minabsaccum_ opcode is designed to accumulate the minimum value from among many audio signals that may be in different note instances, different channels, or otherwise cannot all be compared at once using the _minabs_ opcode.  _minabsaccum_ is identical to _minaccum_ except that it takes the absolute value of aInput before the comparison.  Its semantics are similar to _vincr_ since _aAccumulator_ is used as both an input and an output variable, except that _minabsaccum_ keeps the minimum absolute value instead of adding the signals together.  _minabsaccum_ performs the following operation on each pair of samples:

```
if  (abs(aInput) &lt; aAccumulator)  aAccumulator = abs(aInput)
```

_aAccumulator_ will usually be a global audio variable.  At the end of any given computation cycle (k-period), after its value is read and used in some way, the accumulator variable should usually be reset to some large enough positive value that will always be greater than the input signals to which it is compared.

## Examples

Here is an example of the minabsaccum opcode. It uses the file [minabsaccum.csd](../examples/minabsaccum.csd).

``` csound-csd title="Example of the minabsaccum opcode." linenums="1"
--8<-- "examples/minabsaccum.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
