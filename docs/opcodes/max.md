<!--
id:max
category:Signal Modifiers:Comparators and Accumulators
-->
# max
Produces a signal that is the maximum of any number of input signals.

The _max_ opcode takes any number of a-rate, k-rate or i-rate signals as input (all of the same rate), and outputs a signal at the same rate that is the maximum of all of the inputs.  For a-rate signals, the inputs are compared one sample at a time (i.e. _max_ does not scan an entire ksmps period of a signal for its local maximum as the _max_k_ opcode does).

## Syntax
=== "Modern"
    ``` csound-orc
    amax = max(ain1, ain2 [, ain3] [, ain4] [...])
    kmax = max(kin1, kin2 [, kin3] [, kin4] [...])
    imax = max(iin1, iin2 [, iin3] [, iin4] [...])
    ```

=== "Classic"
    ``` csound-orc
    amax max ain1, ain2 [, ain3] [, ain4] [...]
    kmax max kin1, kin2 [, kin3] [, kin4] [...]
    imax max iin1, iin2 [, iin3] [, iin4] [...]
    ```

### Performance

_ain1, ain2, ..._ --  a-rate signals to be compared.

_kin1, kin2, ..._ --  k-rate signals to be compared.

_iin1, iin2, ..._ --  i-rate signals to be compared.

## Examples

Here is an example of the max opcode. It uses the file [max.csd](../examples/max.csd).

``` csound-csd title="Example of the max opcode." linenums="1"
--8<-- "examples/max.csd"
```

## See also

[Comparators and Accumulators](../sigmod/compaccum.md)

## Credits

Author: Anthony Kozar<br>
March 2006<br>

New in Csound version 5.01; i-rate version new in 6.04
