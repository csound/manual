<!--
id:min
category:Signal Modifiers:Comparators and Accumulators
-->
# min
Produces a signal that is the minimum of any number of input signals.

The _min_ opcode takes any number of a-rate, k-rate or i-rate signals as input (all of the same rate), and outputs a signal at the same rate that is the minimum of all of the inputs.  For a-rate signals, the inputs are compared one sample at a time (i.e. _min_ does not scan an entire ksmps period of a signal for its local minimum as the _max_k_ opcode does).

## Syntax
=== "Modern"
    ``` csound-orc
    amin = min(ain1, ain2 [, ain3] [, ain4] [...])
    kmin = min(kin1, kin2 [, kin3] [, kin4] [...])
    imin = min(iin1, iin2 [, iin3] [, iin4] [...])
    ```

=== "Classic"
    ``` csound-orc
    amin min ain1, ain2 [, ain3] [, ain4] [...]
    kmin min kin1, kin2 [, kin3] [, kin4] [...]
    imin min iin1, iin2 [, iin3] [, iin4] [...]
    ```

### Performance

_ain1, ain2, ..._ --  a-rate signals to be compared.

_kin1, kin2, ..._ --  k-rate signals to be compared.

_iin1, iin2, ..._ --  i-rate signals to be compared.

## Examples

Here is an example of the min opcode. It uses the file [min.csd](../examples/min.csd).

``` csound-csd title="Example of the min opcode." linenums="1"
--8<-- "examples/min.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01; i-rate version new in 6.04
