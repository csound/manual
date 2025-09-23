<!--
id:lpshold
category:Signal Generators:Linear and Exponential Generators
-->
# lpshold
Generate control signal consisting of held segments.

The segments are delimited by two or more specified points. The entire envelope is looped at _kfreq_ rate. Each parameter can be varied at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ksig = lpshold(kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \
                   [, kvalue2] [, ktime2] [...])
    ```

=== "Classic"
    ``` csound-orc
    ksig lpshold kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \
                 [, kvalue2] [, ktime2] [...]
    ```

### Performance

_ksig_ -- Output signal

_kfreq_ -- Repeat rate in Hz or fraction of Hz

_ktrig_ -- If non-zero, retriggers the envelope from start (see [trigger opcode](../opcodes/trigger.md)), before the envelope cycle is completed.

_iphase_ -- A vaue between 0 and 1 to say where to start the loop.  Zero, the commonest value, indicates the beginning.

_kvalue0...kvalueN_ -- Values of points

_ktime0...ktimeN_ -- Times between points; expressed in fractions of a cycle (see below). The final time designates a ramp between the final value and the first value.

_lpshold_ is similar to [loopseg](../opcodes/loopseg.md), but can generate only horizontal segments, i.e. holds values for each time interval placed between _ktimeN_ and _ktimeN+1_. It can be useful, among other things, for melodic control, like old analog sequencers.

## Examples

Here is an example of the lpshold opcode. It uses the file [lpshold.csd](../examples/lpshold.csd).

``` csound-orc title="Example of the lpshold opcode." linenums="1"
--8<-- "examples/lpshold.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.13
