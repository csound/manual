<!--
id:nstrstr
category:Instrument Control:Initialization and Reinitialization
-->
# nstrstr
Returns an instrument name from its number, or an empty string if no name matches.

[instrstr](instrstr.md) is another name for this opcode in Csound 7.

## Syntax
=== "Modern"
    ``` csound-orc
    Sname = nstrstr(insno)
    Sname = nstrstr(knsno)
    ```

=== "Classic"
    ``` csound-orc
    Sname nstrstr insno
    Sname nstrstr knsno
    ```

### Initialization

_insno_ -- the instrument number of the named instrument.

### Performance

_knsno_ -- the instrument number to look up on each control cycle. The i-rate form looks it up once at initialization.

_Sname_ -- the named instrument's name.

If an instrument with the specified name does not exist an empty string is returned.

## Examples

Here is an example of the nstrstr opcode. It uses the file [nstrnum_nstrstr.csd](../examples/nstrnum_nstrstr.csd).

``` csound-csd title="Example of the nstrstr opcode." linenums="1"
--8<-- "examples/nstrnum_nstrstr.csd"
```

The example will produce the following output:

```
instrument name = john
instrument number = 2
```

## See also

[instrstr](instrstr.md), [instrnum](instrnum.md), [str](str.md)

## Credits

Author: John ffitch<br>
New in version 6.13<br>
Written in the year 2019.<br>
