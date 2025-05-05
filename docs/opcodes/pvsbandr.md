<!--
id:pvsbandr
category:Spectral Processing:Streaming
-->
# pvsbandr
A band reject filter working in the spectral domain.

Filter the pvoc frames, rejecting bins whose frequency is within a band, and with linear interpolation for transitional bands.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsbandr(fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsbandr fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype]
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_xlowcut, xlowfull, xhighfull, xhighcut_ -- define a trapezium shape for the band that is rejected.  The a-rate versions only apply to the sliding case.

_ktype_ -- specifies the shape of the transitional band.  If at the default value of zero the shape is as below, with linear transition in amplitude.  Other values give an exponential curve

```
(1 - exp( r*type )) / (1 - exp(type))
```

This includes a linear dB shape when _ktype_ is _log_(10) or about 2.30.

The opcode performs a band-reject filter with a spectral envelope shaped like

```
        klowcut                       khighcut
________                                      ______________
        \                                    /
         \                                  /
          \                                /
           \                              /  
            \                            /    
     klowfull\__________________________/ khighfull
```

## Examples

Here is an example of the pvsbandr opcode. It uses the file [pvsbandr.csd](../examples/pvsbandr.csd).

``` csound-csd title="Example of the pvsbandr opcode." linenums="1"
--8<-- "examples/pvsbandr.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: John ffitch<br>
December 2007 <br>
