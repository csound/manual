<!--
id:GEN53
category:
-->
# GEN53
Creates a linear-phase or minimum-phase impulse response table from a source table containing a frequency response or an impulse response.

Optionally, another function table can be used to window the input and/or the output of the process.

## Syntax
``` csound-orc
f # time size 53 fsrc [mode fwin]
```

*fsrc* - source function table. If this is an impulse response, the size must match the created function table size. If a frequency response is used, then the created function size needs to be twice the size of this source. Power-of-two is required.

> :memo: **Note**
>
> From Csound7, the requirement of a power-of-two is lifted, since support for other FFT sizes is present in Csound. The requirement for table size to be specifically set in relation to the source table is lifted, the size is dynamically adjusted if needed (deferred size also supported now).

*mode* - optional, the operation mode, a sum of (a) input, frequency response (0) or impulse respone (1); (b) output, linear phase (0) or minimum-phase (2); (c) windowing, none (0), input (4) and/or output (8). The default mode (0) is frequency response input, linear-phase output, no windowing.

*fwin* - window function table, power-of-two size is required, but does not need to match the created function table size.

## Examples

Here is a complete example of the GEN53 generator. It uses the file [gen53.csd](../examples/gen53.csd).

``` csound-csd title="Example of the GEN53 generator." linenums="1"
--8<-- "examples/gen53.csd"
```

## Credits

Author: Istvan Varga

Csound7 enhancements by Victor Lazzarini, March 2025.
