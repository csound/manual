<!--
id:mediank
category:Signal Modifiers:Standard Filters
-->
# mediank
A median filter, a variant FIR lowpass filter.


## Syntax
=== "Modern"
    ``` csound-orc
    kres = mediank(kin, ksize, imaxsize [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kres mediank kin, ksize, imaxsize [, iskip]
    ```

### Initialization

_imaxsize_ -- the maximun  size of the window used to select the data.

_iskip_ -- initial disposition of internal data space. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kin_ -- krate value to be filtered

_ksize_ -- size of the window over which the input is to be filtered.  It must not exceed the maximum window size; if it does it is truncated.

_mediank_ is a simple filter that retuns the median value of the last _ksize_ values.  It has a lowpass action.  The efficiency decreases as the window size increases.

## Examples

Here is an example of the mediank opcode. It uses the file [mediank.csd](../examples/mediank.csd).

``` csound-csd title="Example of the mediank opcode." linenums="1"
--8<-- "examples/mediank.csd"
```

## See also

[Standard filters: Variant FIR lowpass filter](../sigmod/standard.md)

## Credits

Author: John ffitch<br>
University of Bath<br>
May 2010<br>

New in Csound version 5.13
