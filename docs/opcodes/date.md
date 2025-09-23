<!--
id:date
category:Instrument Control:Time Reading
-->
# date
Returns the number seconds since a base date, using the operating system's clock.

Plugin opcode in cs_date.

The base is 1 January 1970 for Csound using doubles, and 1 January 2010 for versions using floats. On operating systemms with sufficient resolution the date includes fractional seconds.

## Syntax
=== "Modern"
    ``` csound-orc
    ir[, inano] = date()
    kr[, knano] = date()
    ```

=== "Classic"
    ``` csound-orc
    ir[, inano] date
    kr[, knano] date
    ```

Initialization and Performance

_ir_ -- value at i-time, of the system clock in seconds since the start of the epoch.

_kr_ -- value at k-time, of the system clock in seconds since the start of the epoch.

_inano_ -- value at i-time of the nanoseconds since last second tick.

_knano_ -- value at k-time of the nanoseconds since last second tick.

Note that the base date was originally 1970 bu since version 5.14 it has been changed as single precission floating point numbers are insufficient to indicate changes.

The optional answer and resolution including fractions of a second introduced in version 6.07.

## Examples

Here is an example of the date opcode. It uses the file [date.csd](../examples/date.csd).

``` csound-csd title="Example of the date opcode." linenums="1"
--8<-- "examples/date.csd"
```

Its output should include lines like this:

```
instr 1:  ii = 1447337826.778
instr 1:  ij = 778279830.000
Thu Nov 12 14:17:07 2015
Thu Nov 12 14:17:06 2015
Thu Jan  1 01:00:01 1970
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
December 2006<br>

New in Csound version 5.05

Changed in Csound version 5.14
