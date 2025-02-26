# **Table Access**

The opcodes that access tables are:

* [oscil1](../../opcodes/oscil1)
* [oscil1i](../../opcodes/oscil1i)
* [osciln](../../opcodes/osciln)
* [oscilx](../../opcodes/oscilx)
* [table](../../opcodes/table)
* [table3](../../opcodes/table3)
* [tablei](../../opcodes/tablei)

Opcodes ending in 'i' implement linear interpolation and opcodes ending in '3' implement cubic interpolation.

The following opcodes implement fast table reading/writing without boundary checks:

* [tab](../../opcodes/tab)
* [tab_i](../../opcodes/tab_i)
* [tabw](../../opcodes/tabw)
* [tabw_i](../../opcodes/tabw_i)

See the sections [Table Queries](../../table/queries),
[Read/Write Operations](../../table/readwrit) and
[Table Reading with Dynamic Selection](../../table/select)
for other table operations.
