<!--
id:maxaccum
category:Signal Modifiers:Comparators and Accumulators
-->
# maxaccum
Accumulates the maximum value of audio signals.

_maxaccum_ compares two audio-rate variables and stores the maximum value between them into the first.

## Syntax
=== "Modern"
    ``` csound-orc
    maxaccum(aAccumulator, aInput)
    ```

=== "Classic"
    ``` csound-orc
    maxaccum aAccumulator, aInput
    ```

### Performance

_aAccumulator_ -- audio variable to store the maximum value

_aInput_ -- signal that aAccumulator is compared to

The _maxaccum_ opcode is designed to accumulate the maximum value from among many audio signals that may be in different note instances, different channels, or otherwise cannot all be compared at once using the _max_ opcode.  Its semantics are similar to _vincr_ since _aAccumulator_ is used as both an input and an output variable, except that _maxaccum_ keeps the maximum value instead of adding the signals together.  _maxaccum_ performs the following operation on each pair of samples:

```
if  (aInput > aAccumulator)  aAccumulator = aInput
```

_aAccumulator_ will usually be a global audio variable.  At the end of any given computation cycle (k-period), after its value is read and used in some way, the accumulator variable should usually be reset to zero  (perhaps by using the _clear_ opcode).  Care must be taken however if aInput is negative at any point, in which case the accumulator should be initialized and reset to some large enough negative value that will always be less than the input signals to which it is compared.

## Examples

Here is an example of the maxaccum opcode. It uses the file [maxaccum.csd](../examples/maxaccum.csd).

``` csound-csd title="Example of the maxabs opcode." linenums="1"
--8<-- "examples/maxaccum.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
