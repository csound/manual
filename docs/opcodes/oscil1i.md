<!--
id:oscil1i
category:Signal Generators:Table Access
-->
# oscil1i
Accesses table values by incremental sampling with linear interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = oscil1i(idel, kamp, idur [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    kres oscil1i idel, kamp, idur [, ifn]
    ```

### Initialization

_idel_ -- delay in seconds before _oscil1i_ incremental sampling begins.

_idur_ -- duration in seconds to sample through the _oscil1i_ table just once. A negative value will make the table be read from the end to the beginning.

_ifn_ -- (optional) function table number. _oscil1i_ requires the extended guard point.  The default value is -1 indicating a sine wave.

### Performance

_kamp_ -- amplitude factor

_oscil1i_ is an interpolating unit in which the fractional part of index is used to interpolate between adjacent table entries. The smoothness gained by interpolation is at some small cost in execution time (see also [oscili](../opcodes/oscili.md), etc.), but the interpolating and non-interpolating units are otherwise interchangeable.

## Examples

Here is an example of the oscil1i opcode. It uses the file [oscil1i.csd](../examples/oscil1i.csd).

``` csound-orc title="Example of the oscil1i opcode." linenums="1"
--8<-- "examples/oscil1i.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)
