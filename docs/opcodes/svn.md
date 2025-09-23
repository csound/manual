<!--
id:svn
category:Signal Modifiers:Standard Filters:Resonant
-->
# svn
Non-linear state variable filter.

It has overdrive control and optional user-defined non-linear transfer function.

## Syntax
=== "Modern"
    ``` csound-orc
    ahp,alp,abp,abr = svn(asig, xcf, xQ, kdrive[, ifn,inm,imx, istor])
    ```

=== "Classic"
    ``` csound-orc
    ahp,alp,abp,abr svn asig, xcf, xQ, kdrive[, ifn,inm,imx, istor]
    ```

### Initialization

_ifn_ -- if non-zero, a function table number containing the transfer function for the filter non-linearity. This should be mid-point centered and defined in the interval -imx to imx. If zero, the filter employs an internal non-linear map based on a hyperbolic tangent. Defaults to 0.

_inm_ -- if non-zero, a function table number containing a normalising transfer function, generated from ifn (using GEN 4). Defaults to 0.

_imx_ -- The absolute max of the function table domain, which is defined as  -imx to imx. Defaults to 1.

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant.  A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ahp, alp, abp, abr_ -- highpass, lowpass, bandpass and bandreject ouputs.

_asig_ -- input

_xcf_ -- filter cutoff frequency (a- or k-rate)

_xQ_ -- filter Q (min 0.5) (a- or k-rate).

_kdrive_ -- overdrive factor. With the internal non-linear map, values above 0.125 will introduce progressively more non-linearities in the filter signal. When using a user-supplied transfer function, the amount of distortion introduced by this parameter will depend on the function employed. A value of 0 makes the filter completely linear. The amount of drive is also dependent on the level of the input signal. If this signal is significantly less than 0dBFS, then proportionally more drive is needed to introduce non-linearities in the signal. With a 0dBFS-level input, 100% drive is achieved with kdrive=1. With hotter input levels, kdrive can be used to moderate the non-linear distortion in the filter.

## Examples

Here is an example of the svn opcode. It uses the file [svn.csd](../examples/svn.csd).

``` csound-csd title="Example of the svn opcode." linenums="1"
--8<-- "examples/svn.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Victor Lazzarini<br>
Feb 2021<br>
