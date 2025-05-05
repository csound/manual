<!--
id:maca
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# maca
Multiply and accumulate a-rate signals only.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = maca(asig1 , asig2 [, asig3] [, asig4] [, asig5] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares maca asig1 , asig2 [, asig3] [, asig4] [, asig5] [...]
    ```

### Performance

_asig1, asig2, ..._ -- a-rate input signals

_maca_ multiplies and accumulates a-rate signals only. It is equivalent to:

```
ares = asig1*asig2 + asig3*asig4 + asig5*asig6 + ...
```

## Examples

Here is an example of the maca opcode. It uses the file [maca.csd](../examples/maca.csd). It is written for *NIX systems, and will generate errors on Windows.

``` csound-csd title="Example of the maca opcode." linenums="1"
--8<-- "examples/maca.csd"
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist, Ltd.<br>
Bath, UK<br>
May 1999<br>

New in Csound version 3.54
