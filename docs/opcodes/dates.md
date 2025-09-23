<!--
id:dates
category:Instrument Control:Time Reading
-->
# dates
Returns as a string the date and time specified.

Plugin opcode in cs_date.

## Syntax
=== "Modern"
    ``` csound-orc
    Sir = dates([ itime])
    ```

=== "Classic"
    ``` csound-orc
    Sir dates [ itime]
    ```

### Initialization

_itime_ -- the time is seconds since the start of the epoch.  If omited or negative the current time is taken.

_Sir_ -- the date and time as a string.

## Examples

Here is an example of the dates opcode. It uses the file [dates.csd](../examples/dates.csd).

``` csound-csd title="Example of the dates opcode." linenums="1"
--8<-- "examples/dates.csd"
```

Its output should include lines like this:

```
File '2011_Jan_05_19_14_46.wav' written to the same directory as this CSD file is!
Closing file '/home/user/csound/Output/2011_Jan_05_19_14_46.wav'...
```

## See also

[Time Reading](../control/timeread.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
December 2006<br>

New in Csound version 5.05
