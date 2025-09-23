<!--
id:maxabs
category:Signal Modifiers:Comparators and Accumulators
-->
# maxabs
Produces a signal that is the maximum of the absolute values of any number of input signals.

The _maxabs_ opcode takes any number of a-rate or k-rate signals as input (all of the same rate), and outputs a signal at the same rate that is the maximum of all of the inputs.  It is identical to the _max_ opcode except that it takes the absolute value of each input before comparing them.  Therefore, the output is always non-negative.  For a-rate signals, the inputs are compared one sample at a time (i.e. _maxabs_ does not scan an entire ksmps period of a signal for its local maximum as the _max_k_ opcode does).

## Syntax
=== "Modern"
    ``` csound-orc
    amax = maxabs(ain1, ain2 [, ain3] [, ain4] [...])
    kmax = maxabs(kin1, kin2 [, kin3] [, kin4] [...])
    ```

=== "Classic"
    ``` csound-orc
    amax maxabs ain1, ain2 [, ain3] [, ain4] [...]
    kmax maxabs kin1, kin2 [, kin3] [, kin4] [...]
    ```

### Performance

_ain1, ain2, ..._ --  a-rate signals to be compared.

_kin1, kin2, ..._ --  k-rate signals to be compared.

## Examples

Here is an example of the maxabs opcode. It uses the file [maxabs.csd](../examples/maxabs.csd).

``` csound-csd title="Example of the maxabs opcode." linenums="1"
--8<-- "examples/maxabs.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
