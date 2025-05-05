<!--
id:pvsbandp
category:Spectral Processing:Streaming
-->
# pvsbandp
A band pass filter working in the spectral domain.

Filter the pvoc frames, passing bins whose frequency is within a band, and with linear interpolation for transitional bands.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsbandp(fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsbandp fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_xlowcut, xlowfull, xhighfull, xhighcut_ -- define a trapezium shape for the band that is passed.  The a-rate versions only apply to the sliding case.

_ktype_ -- specifies the shape of the transitional band.  If at the default value of zero the shape is as below, with linear transition in amplitude.  Other values yield and exponential shape:

```
(1 - exp( r*type )) / (1 - exp(type))
```

This includes a linear dB shape when _ktype_ is _log_(10) or about 2.30.

The opcode performs a band-pass filter with a spectral envelope shaped like

```
     klowfull __________________________ khighfull
             /                          \
            /                            \
           /                              \
          /                                \
         /                                  \
________/                                    \______________
        klowcut                       khighcut
```

## Examples

Here is an example of the pvsbandp opcode. It uses the file [pvsbandp.csd](../examples/pvsbandp.csd).

``` csound-csd title="Example of the pvsbandp opcode." linenums="1"
--8<-- "examples/pvsbandp.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: John ffitch<br>
December 2007 <br>
