<!--
id:birnd
category:Mathematical Operations:Random Functions
-->
# birnd
Returns a random number in a bi-polar range.

## Syntax
``` csound-orc
birnd(x) (init- or control-rate only)
```

Where the argument within the parentheses may be an expression. These value converters sample a global random sequence, but do not reference _seed_. The result can be a term in a further expression.

### Performance

Returns a random number in the bipolar range -_x_ to _x_. _rnd_ and _birnd_ obtain values from a global pseudo-random number generator, then scale them into the requested range. The single global generator will thus distribute its sequence to these units throughout the performance, in whatever order the requests arrive.

## Examples

=== "Modern"
    Here is an example of the birnd opcode. It uses the file [birnd-modern.csd](../examples/birnd-modern.csd).
    ``` csound-orc title="Example of the birnd opcode." linenums="1"
    --8<-- "examples/birnd-modern.csd"
    ```

=== "Classic"
    Here is an example of the birnd opcode. It uses the file [birnd.csd](../examples/birnd.csd).
    ``` csound-orc title="Example of the birnd opcode." linenums="1"
    --8<-- "examples/birnd.csd"
    ```

Its output should include lines like:

```
instr 1:  i1 = 0.94700
instr 1:  i1 = -0.72119
instr 1:  i1 = 0.53898
instr 1:  i1 = 0.05001
instr 1:  i1 = 0.24533
instr 1:  i1 = 0.93902
instr 1:  i1 = 0.43364
```

## See also

[Random Functions](../math/rndfunc.md)

## Credits

Author: Barry L. Vercoe<br>
MIT<br>
Cambridge, Massachussetts<br>
1997<br>

Extended in 3.47 to x-rate by John ffitch.
