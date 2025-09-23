<!--
id:tablekt
category:Table Control:Dynamic Selection
-->
# tablekt
Provides k-rate control over table numbers.

The standard Csound opcode [table](../opcodes/table.md) when producing a k- or a-rate result, can only use an init-time variable to select the table number. _tablekt_ accepts k-rate control as well as i-time. In all other respects they are similar to the original opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tablekt(xndx, kfn [, ixmode] [, ixoff] [, iwrap])
    kres = tablekt(kndx, kfn [, ixmode] [, ixoff] [, iwrap])
    ```

=== "Classic"
    ``` csound-orc
    ares tablekt xndx, kfn [, ixmode] [, ixoff] [, iwrap]
    kres tablekt kndx, kfn [, ixmode] [, ixoff] [, iwrap]
    ```

### Initialization

_ixmode_ -- if 0, _xndx_ and _ixoff_ ranges match the length of the table. if non-zero _xndx_ and _ixoff_ have a 0 to 1 range. Default is 0

_ixoff_ -- if 0, total index is controlled directly by _xndx,_ ie. the indexing starts from the start of the table. If non-zero, start indexing from somewhere else in the table. Value must be positive and less than the table length (_ixmode_ = 0) or less than 1 (_ixmode_ not equal to 0). Default is 0.

_iwrap_ -- if _iwrap_ = 0, _Limit mode_: when total index is below 0, then final index is 0.Total index above table length results in a final  index of the table length - high out of range total indexes stick at the upper limit of the table. If _iwrap_ not equal to 0, _Wrap mode_: total index is wrapped  modulo the table length so that all total indexes map into the table. For instance, in a table of length 8, _xndx_ = 5 and _ixoff_ = 6 gives a total index of 11, which wraps to a final  index of 3. Default is 0.

### Performance

_kndx_ -- Index into table, either a positive number range matching the table length (_ixmode_ = 0) or a 0 to 1 range (_ixmode_ not equal to 0).

_xndx_ -- matching the table length (_ixmode_ = 0) or a 0 to 1 range (_ixmode_ not equal to  0)

_kfn_ -- Table number. Must be &gt;= 1. Floats are rounded down to an integer.  If a table number does not point to a valid table, or the table has not yet been loaded ([GEN01](../scoregens/gen01.md)) then an error will result and the instrument will be de-activated.

> :warning: **Caution with k-rate table numbers**
>
> At k-rate, if a table number of &lt; 1 is given, or the table number points to a non-existent table, or to one which has a length of 0 (it is to be loaded from a file later) then an error will result and the instrument will be deactivated. _kfn_ must be initialized at the appropriate rate using [init](../opcodes/init.md). Attempting to load an i-rate value into _kfn_ will result in an error.

## Examples

Here is an example of the tablekt opcode. It uses the file [tablekt.csd](../examples/tablekt.csd).

``` csound-csd title="Example of the tablekt opcode." linenums="1"
--8<-- "examples/tablekt.csd"
```

Its output should include lines like these:

```
i1     2.00000
i1     1.00000
i1     2.00000
i1     1.00000
....
```

## See also

[Table Reading with Dynamic Selection](../table/select.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>

New in version 3.47
