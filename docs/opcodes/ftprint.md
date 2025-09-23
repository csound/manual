<!--
id:ftprint
category:Table Control:Read/Write Operations
-->
# ftprint
Print the contents of a table (for debugging).

Plugin opcode in emugens.

It works at k-time, a trigger controls when to print (use ktrig=1, which is the default, to print only at i-time)

## Syntax
=== "Modern"
    ``` csound-orc
    ftprint(ifn [, ktrig, kstart, kend, kstep, inumcols ])
    ```

=== "Classic"
    ``` csound-orc
    ftprint ifn [, ktrig, kstart, kend, kstep, inumcols ]
    ```

### Initialization

_ifn_ - The table to print

_inumcols_ - The number of elements to print in one column (default = 10)

### Performance

_ktrig_ - The table will be printed whenever this value changes from 0 to possitive. Can be used together with metro to print at a given time interval. A value of -1 indicates to print at each k-cycle (default = 1)

_kstart_ - The first index to print. (default = 0)

_kend_ - The end index to print (non inclusive). (default = length of table)

_kstep_ - How many elements to skip (default = 1)

## Examples

Here is an example of the ftprint opcode. It uses the file [ftprint.csd](../examples/ftprint.csd).

``` csound-csd title="Example of the ftprint opcode." linenums="1"
--8<-- "examples/ftprint.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)

[Read/Write Operations](../table/readwrit.md)

## Credits

By: Eduardo Moguillansky 2018

New plugin in version 6.12
