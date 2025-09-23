<!--
id:f
category:
-->
# f Statement (or Function Table Statement)
Causes a GEN subroutine to place values in a stored function table for use by instruments.

## Syntax
``` csound-orc
f p1  p2  p3  p4  p5 ... PMAX
```

### Performance

_p1_ -- Table number by which the stored function will be known. A negative number requests that the table be destroyed.

_p2_ -- Action time of function generation (or destruction) in beats.

_p3_ -- Size of function table (i.e.  number of points). Some GEN routines allow the table size to be set dynamically according to routine inputs (e.g. file size), in a process called deferred-size allocation. In this case, we can set the table size to 0 to take advantage of this mechanism. Maximum fixed table size is 16777216 (2<sup>24</sup>) points, but larger tables can be created with deferred-size allocation.

_p4_ -- Number of the GEN routine to be called (see [GEN Routines](../score/genroutines.md)). A negative value will cause rescaling to be omitted.

_p5 ... PMAX_ -- Parameters whose meaning is determined by the particular GEN routine.

### Special Considerations

Function tables are arrays of floating-point values. You can create a simple sine wave using the line:

```
f 1 0 1024 10 1
```

This table uses [GEN10](../scoregens/gen10.md) to fill the table.

Historically, due to older platform constraints, Csound could only accept tables whose size was a power of two. This limitation has been removed in recent versions, and you can freely create tables of any size.

> :memo: **Note**
>
> All opcodes will accept tables whose size is not a power of two; however some of them will use a more optimised phase update code if a power-of-two size is used. So we would recommend using power-of-two sizes if possible.

Space allocation always provides for the set number of points plus an additional _guard point_, used for linear interpolation. By default, this point contains a copy of the first position on the table, which is the expected for wrap-around (looping) lookup (e.g. an oscillator reading a function table).

For situations where the lookup is expected to end at the last point of the table (e.g. envelope segments), then the correct guard point setting should be to extend the table for one more point (according to the GEN employed). This is called an _extended guard point_. To request this, special codes are used:

- _Power-of-two size tables_: users should set the size to the required size + 1. For example, a 1024-size table should be set to 1025. To bypass this request and instead create a non-power-of-two size, use a negative size: -1025 produces a 1025-size table with default guard point.

- _Non power-of-two size tables_: users should set the size to the required size + 0.1 (or any other fractional value between 0 and 1). For example, a 1000-size table should be set as 1000.1.

Table space is allocated in primary memory, along with instrument data space. The maximum table number used to be 200. This has been changed to be limited by memory only. (Currently there is an internal soft limit of 300, this is automatically extended as required.)

An existing function table can be removed by an _f statement_ containing a negative p1 and an appropriate action time. A function table can also be removed by the generation of another table with the same p1. Functions are not automatically erased at the end of a score section.

p2 action time is treated in the same way as in _i statement_s with respect to sorting and modification by _t statement_s. If an _f statement_ and an _i statement_ have the same p2, the sorter gives the _f statement_ precedence so that the function table will be available during note initialization.

> :warning: **Warning**
>
> The maximum number of p-fields accepted in the score is determined by PMAX (a compilation time varible). PMAX is currently set to 1000. This may discard values entered when using [GEN02](../scoregens/gen02.md). To overcome this, use [GEN23](../scoregens/gen23.md) or [GEN28](../scoregens/gen28.md) to read the values from a file.

An _f 0 statement_ (zero p1, positive p2) may be used to create an action time with no associated action. Such time markers are useful for padding out a score section (see [s statement](../scoregens/s.md)) and for letting Csound run from realtime events only (e.g. using only MIDI input without score events). The time given is the number of seconds Csound will run. If you want Csound to run for 10 hours, use:

```
f0 36000
```

The simplest way to fill a table (f1) with 0's is:

```
f1 0 xx 2 0
```

where xx = table size.

The simplest way to fill a table (f1) with *any* single value is:

```
f1 0 xx -7 yy xx yy
```

where xx = table size and yy = any single value

In both of the above examples, table size (p3) must be a power of 2 or power-of-2 plus 1.

## See also

[GEN Routines](../score/genroutines.md)

[Score Statements](../score/statemnt.md)

## Credits

Updated August 2024 for Csound 7.
