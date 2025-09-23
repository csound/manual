<!--
id:oscil1
category:Signal Generators:Table Access
-->
# oscil1
Accesses table values by incremental sampling.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = oscil1(idel, kamp, idur [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    kres oscil1 idel, kamp, idur [, ifn]
    ```

### Initialization

_idel_ -- delay in seconds before _oscil1_ incremental sampling begins.

_idur_ -- duration in seconds to sample through the _oscil1_ table just once. A negative value will make the table be read from the end to the beginning.

_ifn_ -- (optional) function table number. _tablei, oscil1i_ require the extended guard point.  The number defaults to -1 which indicates a sinewave.

### Performance

_kamp_ -- amplitude factor.

_oscil1_ accesses values by sampling once through the function table at a rate determined by _idur_. For the first _idel_ seconds, the point of scan will reside at the first location of the table; it will then begin moving through the table at a constant rate, reaching the end in another _idur_ seconds; from that time on (i.e. after _idel_ + _idur_ seconds) it will remain pointing at the last location. Each value obtained from sampling is then multiplied by an amplitude factor _kamp_ before being written into the result.

## Examples

Here is an example of the oscil1 opcode. It uses the file [oscil1.csd](../examples/oscil1.csd).

``` csound-orc title="Example of the oscil1 opcode." linenums="1"
--8<-- "examples/oscil1.csd"
```

The example will produce the following output:

```
i1     0.50000
i1     0.20000
i1     0.80000
i1     0.10000
i1     0.90000
i1     0.00000
i1     1.00000
i1     0.50000
```

## See Also

[Table Access](../siggen/tableacc.md)
