<!--
id:tabmorpha
category:Table Control:Read/Write Operations
-->
# tabmorpha
Allows morphing between a set of tables of the same size, by means of a weighted average between two currently selected tables.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = tabmorpha(aindex, aweightpoint, atabnum1, atabnum2, ifn1, ifn2 \
                     [, ifn3, ifn4, ... ifnN])
    ```

=== "Classic"
    ``` csound-orc
    aout tabmorpha aindex, aweightpoint, atabnum1, atabnum2, ifn1, ifn2 \
                   [, ifn3, ifn4, ... ifnN]
    ```

### Initialization

_ifn1, ifn2 , ifn3, ifn4, ... ifnN_ - function table numbers. This is a set of chosen tables the user want to use in the morphing. All tables must have the same length. Be aware that only two of these tables can be chosen for the morphing at one time. Since it is possible to use non-integer numbers for the _atabnum1_ and _atabnum2_ arguments, the morphing is the result from the interpolation between adjacent consecutive tables of the set.

### Performance

_aout_ - The output value for index _aindex_, resulting from morphing two tables (see below).

_aindex_ - main index index of the morphed resultant table. The range is 0 to table_length (not included).

_aweightpoint_ - the weight of the influence of a pair of selected tables in the morphing. The range of this argument is 0 to 1. A zero makes it output the first table unaltered, a 1 makes it output the second table of the pair unaltered. All intermediate values between 0 and 1 determine the gradual morphing between the two tables of the pair.

_atabnum1_ - the first table chosen for the morphing. This number doesn’t express the table number directly, but the position of the table in the set sequence (starting from 0 to N-1). If this number is an integer, the corresponding table will be chosen unaltered. If it contains fractional values, then an interpolation with the next adjacent table will result.

_atabnum2_ - the second table chosen for the morphing. This number doesn’t express the table number directly, but the position of the table in the set sequence (starting from 0 to N-1). If this number is an integer, corresponding table will be chosen unaltered. If it contains fractional values, then an interpolation with the next adjacent table will result.

The _tabmorpha_ family of opcodes is similar to the [table](../opcodes/table.md) family, but allows morphing between two tables chosen into a set of tables. Firstly the user has to provide a set of tables of equal length (ifn2 [, ifn3, ifn4,…ifnN]). Then he can choose a pair of tables in the set in order to perform the morphing: _atabnum1_ and _atabnum2_ are filled with numbers (zero represents the first table in the set, 1 the second, 2 the third and so on). Then determine the morphing between the two chosen tables with the _aweightpoint_ parameter. After that the resulting table can be indexed with the _aindex_ parameter like a normal _table_ opcode. If the value of this parameter surpasses the length of tables (which must be the same for all tables), then it is wrapped around.

_tabmorpha_ is the audio-rate version of [tabmorphi](../opcodes/tabmorphi.md) (it uses interpolation). All input arguments work at a-rate.

## Examples

Here is an example of the tabmorpha opcode. It uses the file [tabmorpha.csd](../examples/tabmorpha.csd).

``` csound-csd title="Example of the tabmorpha opcode." linenums="1"
--8<-- "examples/tabmorpha.csd"
```

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Gabriel Maldonado

New in version 5.06
