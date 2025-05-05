<!--
id:transeg
category:Signal Generators:Linear and Exponential Generators
-->
# transeg
Constructs a user-definable envelope.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = transeg(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    kres = transeg(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    ```

=== "Classic"
    ``` csound-orc
    ares transeg ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    kres transeg ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    ```

### Initialization

_ia_ -- starting value.

_ib, ic,_ etc. -- value after _idur_ seconds.

_idur_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2,... idurx_ etc. -- duration in seconds of segment

_itype, itype2,_ etc. -- if 0, a straight line is produced. If non-zero, then _transeg_ creates the following curve, for _n_ steps:

```
ibeg + (ivalue - ibeg) * (1 - exp( i*itype/(n-1) )) / (1 - exp(itype))
```

### Performance

If _itype_ &gt; 0, there is a slowly rising (concave) or slowly decaying (convex) curve, while if _itype_ &lt; 0, the curve is fast rising (convex) or fast decaying (concave). See also [GEN16](../scoregens/gen16.md).

## Examples

Here is an example of the transeg opcode. It uses the file [transeg.csd](../examples/transeg.csd). The example produces the following output:

<figure markdown="span">
![Output of the transeg example.](../images/transeg.png)
<figcaption>Output of the transeg example.</figcaption>
</figure>

``` csound-orc title="Example of the transeg opcode." linenums="1"
--8<-- "examples/transeg.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
October 2000<br>

New in Csound version 4.09

Thanks goes to Matt Gerassimoff for pointing out the correct command syntax.
