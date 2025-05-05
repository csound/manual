<!--
id:mac
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# mac
Multiplies and accumulates a- and k-rate signals.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = mac(ksig1, asig1 [, ksig2] [, asig2] [, ksig3] [, asig3] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares mac ksig1, asig1 [, ksig2] [, asig2] [, ksig3] [, asig3] [...]
    ```

### Performance

_ksig1, etc._ -- k-rate input signals

_asig1, etc._ -- a-rate input signals

_mac_ multiplies and accumulates a- and k-rate signals. It is equivalent to:

```
ares = asig1*ksig1 + asig2*ksig2 + asig3*ksig3 + ...
```

## Examples

Here is an example of the mac opcode. It uses the file [mac.csd](../examples/mac.csd). It is written for *NIX systems, and will generate errors on Windows.

``` csound-csd title="Example of the mac opcode." linenums="1"
--8<-- "examples/mac.csd"
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist, Ltd.<br>
Bath, UK<br>
May 1999<br>

New in Csound version 3.54
