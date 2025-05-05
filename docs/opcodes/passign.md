<!--
id:passign
category:Instrument Control:Initialization and Reinitialization
-->
# passign
Assigns a range of p-fields to ivariables, or i- or k-array.

## Syntax
=== "Modern"
    ``` csound-orc
    ivar1, ... = passign([istart][, iend])
    iarray = passign([istart][, iend])
    karray = passign([istart][, iend])
    ```

=== "Classic"
    ``` csound-orc
    ivar1, ... passign [istart][, iend]
    iarray passign [istart][, iend]
    karray passign [istart][, iend]
    ```

### Initialisation

The optional argument _istart_ gives the index of the first p-field to assign.  The default value is 1, corresponding to the instrument number.

The optional argument _iend_ gives the index of the last p-field to assign.  The default value is 0, which means all.

One of the variables can be a string variable, in which case it is assigned the only string parameter, if there is one, or an
error otherwise.

### Performance

_passign_ transfers the instrument p-fields to instrument variables, starting with the one identified by the _istart_ argument.   There should not be more variables than p-fields, but there may be fewer.

_passign_ can transfer the instrument p-fields to a one dimensional array, either an iarray or a karray.

## Examples

Here is an example of the passign opcode. It uses the file [passign.csd](../examples/passign.csd).

``` csound-csd title="A variant of toot8.csd that uses passign." linenums="1"
--8<-- "examples/passign.csd"
```

## See also

[assign](../opcodes/assign.md), [pcount](../opcodes/pcount.md).

[Initialization and Reinitialization](../control/reinitn.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>
December 2009<br>

New in version 5.12; end point and array version after 5.12
