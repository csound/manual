<!--
id:transegr
category:Signal Generators:Linear and Exponential Generators
-->
# transegr
Constructs a user-definable envelope with extended release segment.

It is the same as [transeg](../opcodes/transeg.md), with an extended release segment.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = transegr(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    kres = transegr(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    ```

=== "Classic"
    ``` csound-orc
    ares transegr ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    kres transegr ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    ```

### Initialization

_ia_ -- starting value.

_ib, ic,_ etc. -- value after _idur_ seconds.

_idur_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2,... idurx_ etc. -- duration in seconds of segment

_itype, itype2,_ etc. -- if 0, a straight line is produced. If non-zero, then _transegr_ creates the following curve, for _n_ steps:

```
ibeg + (ivalue - ibeg) * (1 - exp( i*itype/(n-1) )) / (1 - exp(itype))
```

### Performance

If _itype_ &gt; 0, there is a slowly rising (concave) or slowly decaying (convex) curve, while if _itype_ &lt; 0, the curve is fast rising (convex) or fast decaying (concave). See also [GEN16](../scoregens/gen16.md).

This opcode is the same as of [transeg](../opcodes/transeg.md) with an additional release segment triggered by a MIDI noteoff event, a negative p1 [note event](../scoregens/i.md) in the score or a [turnoff2](../opcodes/turnoff2.md) opcode.

## Examples

Here is an example of the transegr opcode. It uses the file [transegr.csd](../examples/transegr.csd).

``` csound-orc title="Example of the transegr opcode." linenums="1"
--8<-- "examples/transegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch<br>
january 2010<br>

New in Csound version 5.12
