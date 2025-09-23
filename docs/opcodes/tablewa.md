<!--
id:tablewa
category:Table Control:Read/Write Operations
-->
# tablewa
Writes tables in sequential locations to and from an a-rate variable.

Some thought is required before using it. It has at least two major, and quite different, applications which are discussed below.

## Syntax
=== "Modern"
    ``` csound-orc
    kstart = tablewa(kfn, asig, koff)
    ```

=== "Classic"
    ``` csound-orc
    kstart tablewa kfn, asig, koff
    ```

### Performance

_kstart_ -- Where in table to read or write.

_kfn_ -- i- or k-rate number of the table to read or write.

_asig_ -- a-rate signal to read from when writing to the table.

_koff_ -- i- or k-rate offset into table. Range unlimited - see explanation at end of this section.

In one application, it is intended to be used with one or with several [tablera](../opcodes/tablera.md) opcodes before a _tablewa_ -- all sharing the same _kstart_ variable.

These read from and write to sequential locations in a table at audio rates, with _ksmps_ floats being written and read each cycle.

[tablera](../opcodes/tablera.md) starts reading from location _kstart_. _tablewa_ starts writing to location _kstart_, and then writes to _kstart_ with the number of the location one more than the one it last wrote. (Note that for _tablewa_, _kstart_ is both an input and output variable.) If the writing index reaches the end of the table, then no further writing occurs and zero is written to _kstart_.

For instance, if the table's length was 16 (locations 0 to 15), and _ksmps_ was 5. Then the following steps would occur with repetitive runs of the _tablewa_ opcode, assuming that _kstart_ started at 0.

| Run Number | Initial kstart | Final kstart | Locations Written |
|---|---|---|---|
| 1 | 0 | 5 | 0 1 2 3 4 |
| 2 | 5 | 10 | 5 6 7 8 9 |
| 3 | 10 | 15 | 10 11 12 13 14 |
| 4 | 15 | 0 | 15 |

This is to facilitate processing table data using standard a-rate orchestra code between the [tablera](../opcodes/tablera.md) and _tablewa_ opcodes. They allow all Csound k-rate operators to be used (with caution) on a-rate variables - something that would only be possible otherwise by _ksmps_ = 1, downsamp and upsamp.

> :warning: **Several cautions**
>
> *   The k-rate code in the processing loop is really running at a-rate, so time dependent functions like _port_ and _oscil_ work faster than normal - their code is expecting to be running at k-rate.
> *   This system will produce undesirable results unless the _ksmps_ fits within the table length. For instance a table of length 16 will accommodate 1 to 16 samples, so this example will work with _ksmps_ = 1 to 16.

Both these opcodes generate an error and deactivate the instrument if a table with length &lt; _ksmps_ is selected. Likewise an error occurs if _kstart_ is below 0 or greater than the highest entry in the table - if _kstart_ = table length.

*   _kstart_ is intended to contain integer values between 0 and (table length - 1). Fractional values above this should not affect operation but do not achieve anything useful.
*   These opcodes are not interpolating, and the _kstart_ and _koff_ parameters always have a range of 0 to (table length - 1) - not 0 to 1 as is available in other table read/write opcodes. _koff_ can be outside this range but it is wrapped around by the final AND operation.
*   These opcodes are permanently in wrap mode. When _koff_ is 0, no wrapping needs to occur, since the _kstart_++ index will always be within the table's normal range. _koff_ not equal to  0 can lead to wrapping.
*   The offset does not affect the number of read/write cycles performed, or the value written to _kstart_ by _tablewa_.
*   These opcodes cannot read or write the guardpoint. Use _tablegpw_ to write the guardpoint after manipulations have been done with _tablewa_.

## Examples

``` csound-orc
kstart   =       0         

lab1:
  atemp  tablera ktabsource, kstart, 0  ; Read 5 values from table into an
                                        ; a-rate variable.                  
  atemp  =       log(atemp)             ; Process the values using a-rate code.
  kstart tablewa ktabdest, atemp, 0     ; Write it back to the table
if ktemp  0 goto lab1                   ; Loop until all table locations
                                        ; have been processed.
```

The above example shows a processing loop, which runs every k-cycle, reading each location in the table _ktabsource_, and writing the log of those values into the same locations of table _ktabdest_.

This enables whole tables, parts of tables (with offsets and different control loops) and data from several tables at once to be manipulated with a-rate code and written back to another (or to the same) table. This is a bit of a fudge, but it is faster than doing it with k-rate table read and write code.

Another application is:

``` csound-orc
  kzero = 0                    
  kloop = 0                    

  kzero   tablewa 23, asignal, 0   ; ksmps a-rate samples written
                                   ; into locations 0 to (ksmps -1) of table 23.
lab1:
  ktemp   table    kloop, 23       ; Start a loop which runs ksmps times,
                                   ; in which each cycle processes one of
  [ Some code to manipulate ]      ; table 23's values with k-rate orchestra
  [ the value of ktemp. ]          ; code.

          tablew  ktemp, kloop, 23 ; Write the processed value to the table.
  kloop   = kloop + 1              ; Increment the kloop, which is both the
                                   ; pointer into the table and the loop
  if kloop < ksmps goto lab1       ; counter. Keep looping until all values
                                   ; in the table have been processed.
  asignal tablera 23, 0, 0         ; Copy the table contents back
                                   ; to an a-rate variable.
```

_koff_ -- This is an offset which is added to the sum of _kstart_ and the internal index variable which steps through the table. The result is then ANDed with the lengthmask (000 0111 for a table of length 8 - or 9 with guardpoint) and that final index is used to read or write to the table. _koff_ can be any value. It is converted into a long using the ANSI floor() function so that -4.3 becomes -5. This is what we would want when using offsets which range above and below zero.

Ideally this would be an optional variable, defaulting to 0, however with the existing Csound orchestra read code, such default parameters must be init time only. We want k-rate here, so we cannot have a default.

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
