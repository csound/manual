<!--
id:denorm
category:Signal Modifiers:Sample Level Operators
-->
# denorm
Mixes low level (~1e-20 for floats, and ~1e-56 for doubles) noise to a list of a-rate signals.

Can be used before IIR filters and reverbs to avoid denormalized numbers which may otherwise result in significantly increased CPU usage.

## Syntax
=== "Modern"
    ``` csound-orc
    denorm(a1[, a2[, a3[, ... ]]])
    ```

=== "Classic"
    ``` csound-orc
    denorm a1[, a2[, a3[, ... ]]]
    ```

### Performance

_a1[, a2[, a3[, ... ]]]_ -- signals to mix noise with

Some processor architectures (particularly Pentium IVs) are very slow at processing extremely small numbers. These small numbers can appear as a result of some decaying feedback process like reverb and IIR filters. Low level noise can be added so that very small numbers are never reached, and they are 'absorbed' by this 'noise floor'.

If CPU usage goes to 100% at the end of reverb tails, or you get audio glitches in processes that should not use too much CPU, using _denorm_ before the culprit opcode or process might solve the problem.

## Examples

Here is an example of the denorm opcode. It uses the file [denorm.csd](../examples/denorm.csd).

``` csound-csd title="Example of the denorm opcode." linenums="1"
--8<-- "examples/denorm.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

## Credits

Author: Istvan Varga<br>
2005<br>
