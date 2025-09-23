<!--
id:getftargs
category:Table Control
-->
# getftargs
Fill a string variable with the arguments used to create a function table at k-rate.

Plugin opcode in getftargs.

_getftargs_ runs both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = getftargs(iftno, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    Sdst getftargs iftno, ktrig
    ```

### Initialization

_ifno_ -- Number of the table whose arguments we want to request.

### Performance

_Sdst_ -- output string variable.

_ktrig_ -- trigger signal, should be valid at i-time. The output string variable is filled at initialization time if ktrig is positive, and at performance time whenever ktrig is both positive and different from the previous value. Use a constant value of 1 to print once at note initialization.

## Examples

Here is an example of the getftargs opcode. It uses the file [getftargs.csd](../examples/getftargs.csd).

``` csound-csd title="Example of the getftargs opcode." linenums="1"
--8<-- "examples/getftargs.csd"
```

Its output should include this line:

```
0 0 0.5 200 0.8 450 0.33 600 0.1 800 0.4 1024 0
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Written by Guillermo Senna

2016
