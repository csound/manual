<!--
id:nstrnum
category:Instrument Control:Initialization and Reinitialization
-->
# nstrnum
Returns the number of a named instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    insno = nstrnum("name")
    ```

=== "Classic"
    ``` csound-orc
    insno nstrnum "name"
    ```

### Initialization

_insno_ -- the instrument number of the named instrument.

### Performance

_"name"_ -- the named instrument's name.

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

## See also

[Initialization and Reinitialization](../control/reinitn.md)

## Credits

Author: Istvan Varga<br>
New in version 4.23<br>
Written in the year 2002.<br>
