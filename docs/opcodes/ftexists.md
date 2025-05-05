<!--
id:ftexists
category:Table Control:Table Queries
-->
# ftexists
Query if a given table exists.

Plugin opcode in emugens.

Returns 1 if a given index refers to an existing table, 0 if the table does not exist. Works at i-time if output is an ivariable, at k-time otherwise

## Syntax
=== "Modern"
    ``` csound-orc
    iexists = ftexists(ifn)
    kexists = ftexists(kfn / ifn)
    ```

=== "Classic"
    ``` csound-orc
    iexists ftexists ifn
    kexists ftexists kfn / ifn
    ```

### Arguments

_ifn / kfm_ - The table to query

### Output

_iexists / kexists_ - 1 if the table exists, 0 otherwise

## Examples

Here is an example of the ftexists opcode. It uses the file [ftexists.csd](../examples/ftexists.csd).

``` csound-csd title="Example of the ftexists opcode." linenums="1"
--8<-- "examples/ftexists.csd"
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

By: Eduardo Moguillansky 2019

New plugin in version 6.14
