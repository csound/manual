<!--
id:minabs
category:Signal Modifiers:Comparators and Accumulators
-->
# minabs
Produces a signal that is the minimum of the absolute values of any number of input signals.

The _minabs_ opcode takes any number of a-rate or k-rate signals as input (all of the same rate), and outputs a signal at the same rate that is the minimum of all of the inputs.  It is identical to the _min_ opcode except that it takes the absolute value of each input before comparing them.  Therefore, the output is always non-negative.    For a-rate signals, the inputs are compared one sample at a time (i.e. _minabs_ does not scan an entire ksmps period of a signal for its local minimum as the _max_k_ opcode does).

## Syntax
=== "Modern"
    ``` csound-orc
    amin = minabs(ain1, ain2 [, ain3] [, ain4] [...])
    kmin = minabs(kin1, kin2 [, kin3] [, kin4] [...])
    ```

=== "Classic"
    ``` csound-orc
    amin minabs ain1, ain2 [, ain3] [, ain4] [...]
    kmin minabs kin1, kin2 [, kin3] [, kin4] [...]
    ```

### Performance

_ain1, ain2, ..._ --  a-rate signals to be compared.

_kin1, kin2, ..._ --  k-rate signals to be compared.

## Examples

Here is an example of the minabs opcode. It uses the file [minabs.csd](../examples/minabs.csd).

``` csound-csd title="Example of the minabs opcode." linenums="1"
--8<-- "examples/minabs.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01
