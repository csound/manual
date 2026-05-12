<!--
id:tb
category:Table Control:Table Queries
status:deprecated
-->
# tb
Table Read Access inside expressions.

> :memo: **Note**
> These opcodes have been largely superceded by the functional form of the opcode tab.

Allow to read tables in function fashion, to be used inside expressions. At earlier times Csound only supported functions with a single input argument. However, to access table elements, user must provide two numbers, i.e. the number of table and the index of element. So, in order to allow to access a table element with a function, a previous preparation step should be done.

## Syntax
=== "Modern"
    ``` csound-orc
    tb0_init(ifn)
    tb1_init(ifn)
    tb2_init(ifn)
    tb3_init(ifn)
    tb4_init(ifn)
    tb5_init(ifn)
    tb6_init(ifn)
    tb7_init(ifn)
    tb8_init(ifn)
    tb9_init(ifn)
    tb10_init(ifn)
    tb11_init(ifn)
    tb12_init(ifn)
    tb13_init(ifn)
    tb14_init(ifn)
    tb15_init(ifn)
    iout = tb0(iIndex)
    kout = tb0(kIndex)
    iout = tb1(iIndex)
    kout = tb1(kIndex)
    iout = tb2(iIndex)
    kout = tb2(kIndex)
    iout = tb3(iIndex)
    kout = tb3(kIndex)
    iout = tb4(iIndex)
    kout = tb4(kIndex)
    iout = tb5(iIndex)
    kout = tb5(kIndex)
    iout = tb6(iIndex)
    kout = tb6(kIndex)
    iout = tb7(iIndex)
    kout = tb7(kIndex)
    iout = tb8(iIndex)
    kout = tb8(kIndex)
    iout = tb9(iIndex)
    kout = tb9(kIndex)
    iout = tb10(iIndex)
    kout = tb10(kIndex)
    iout = tb11(iIndex)
    kout = tb11(kIndex)
    iout = tb12(iIndex)
    kout = tb12(kIndex)
    iout = tb13(iIndex)
    kout = tb13(kIndex)
    iout = tb14(iIndex)
    kout = tb14(kIndex)
    iout = tb15(iIndex)
    kout = tb15(kIndex)
    ```

=== "Classic"
    ``` csound-orc
    tb0_init ifn
    tb1_init ifn
    tb2_init ifn
    tb3_init ifn
    tb4_init ifn
    tb5_init ifn
    tb6_init ifn
    tb7_init ifn
    tb8_init ifn
    tb9_init ifn
    tb10_init ifn
    tb11_init ifn
    tb12_init ifn
    tb13_init ifn
    tb14_init ifn
    tb15_init ifn
    iout = tb0(iIndex)
    kout = tb0(kIndex)
    iout = tb1(iIndex)
    kout = tb1(kIndex)
    iout = tb2(iIndex)
    kout = tb2(kIndex)
    iout = tb3(iIndex)
    kout = tb3(kIndex)
    iout = tb4(iIndex)
    kout = tb4(kIndex)
    iout = tb5(iIndex)
    kout = tb5(kIndex)
    iout = tb6(iIndex)
    kout = tb6(kIndex)
    iout = tb7(iIndex)
    kout = tb7(kIndex)
    iout = tb8(iIndex)
    kout = tb8(kIndex)
    iout = tb9(iIndex)
    kout = tb9(kIndex)
    iout = tb10(iIndex)
    kout = tb10(kIndex)
    iout = tb11(iIndex)
    kout = tb11(kIndex)
    iout = tb12(iIndex)
    kout = tb12(kIndex)
    iout = tb13(iIndex)
    kout = tb13(kIndex)
    iout = tb14(iIndex)
    kout = tb14(kIndex)
    iout = tb15(iIndex)
    kout = tb15(kIndex)
    ```

### Performance

There are 16 different opcodes whose name is associated with a number from 0 to 15. User can associate a specific table with each opcode (so the maximum number of tables that can be accessed in function fashion is 16). Prior to access a table, user must associate the table with one of the 16 opcodes by means of an opcode chosen among _tb0_init_, ..., _tb15_init_. For example,

``` csound-orc
tb0_init(1)
```

associates table 1 with tb0( ) function, so that, each element of table 1 can be accessed (in function fashion) with:

``` csound-orc
kvar = tb0(k_some_index_of_table1) * k_some_other_var
```

``` csound-orc
ivar = tb0(i_some_index_of_table1) + i_some_other_var
```

etc...

By using these opcodes, user can drastically reduce the number of lines of an orchestra, improving its readability.

## Credits

Written by Gabriel Maldonado.
