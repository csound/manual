<!--
id:nstrnum
category:Instrument Control:Initialization and Reinitialization
-->
# nstrnum
Returns an instrument number from a name or definition.

[instrnum](instrnum.md) is another name for this opcode in Csound 7.

## Syntax
=== "Modern"
    ``` csound-orc
    insno = nstrnum("name")
    insno = nstrnum(definition[, iOffset])
    ```

=== "Classic"
    ``` csound-orc
    insno nstrnum "name"
    insno nstrnum definition[, iOffset]
    ```

### Initialization

_insno_ -- the instrument number of the named instrument.

`"name"` is the instrument name. `definition` is an `InstrDef`, which can refer to a named or unnamed instrument. Both forms run at initialization.

The definition form accepts an optional numeric `iOffset`, which defaults to 0 and is added to the instrument number. A fractional offset can identify a particular note when scheduling by number.

If an instrument with the specified name does not exist, an init error occurs, and -1 is returned.

## Examples

Here is an example of the nstrnum opcode. It uses the file [nstrnum_nstrstr.csd](../examples/nstrnum_nstrstr.csd).

``` csound-csd title="Example of the nstrnum opcode." linenums="1"
--8<-- "examples/nstrnum_nstrstr.csd"
```

The example will produce the following output:

```
instrument name = john
instrument number = 2
```

A musical examples featuring the nstrnum opcode: [TivalNstrnum_Yi.csd](../examples/musical/TivalNstrnum_Yi.csd) by Steven Yi.


This Csound 7 example uses the `instrnum` and `instrstr` spellings with a named definition. It uses [instrument-names.csd](../examples/instrument-names.csd).

``` csound-csd title="Find the number of a typed definition" linenums="1"
--8<-- "examples/instrument-names.csd"
```

## See also

[instrnum](instrnum.md), [nstrstr](nstrstr.md), [str](str.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

## Credits

Author: Istvan Varga<br>
New in version 4.23<br>
Written in the year 2002.<br>

The `InstrDef` form was added by Victor Lazzarini for Csound 7.
