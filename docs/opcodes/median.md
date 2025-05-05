<!--
id:median
category:Signal Modifiers:Standard Filters
-->
# median
A median filter, a variant FIR lowpass filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = median(asig, ksize, imaxsize [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares median asig, ksize, imaxsize [, iskip]
    ```

### Initialization

_imaxsize_ -- the maximun  size of the window used to select the data.

_iskip_ -- initial
disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal to be filtered

_ksize_ -- size of the window over which the input is to be filtered.  It must not exceed the maximum window size; if it does it is truncated.

_median_ is a simple filter that retuns the median value of the last _ksize_ values.  It has a lowpass action.  The efficiency decreases as the window size increases.

## Examples

Here is an example of the median opcode. It uses the file [median.csd](../examples/median.csd).

``` csound-csd title="Example of the median opcode." linenums="1"
--8<-- "examples/median.csd"
```

## See also

[Standard filters: Variant FIR lowpass filter](../sigmod/standard.md)

## Credits

Author: John ffitch<br>
University of Bath<br>
May 2010<br>

New in Csound version 5.13
