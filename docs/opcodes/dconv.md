<!--
id:dconv
category:Signal Modifiers:Convolution and Morphing
-->
# dconv
A direct convolution opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = dconv(asig, isize, ifn)
    ```

=== "Classic"
    ``` csound-orc
    ares dconv asig, isize, ifn
    ```

### Initialization

_isize_ -- the size of the convolution buffer to use. If the buffer size is smaller than the size of _ifn_, then only the first _isize_ values will be used from the table.

_ifn_ -- table number of a stored function containing the impulse response for convolution.

### Performance

Rather than the analysis/resynthesis method of the _convolve_ opcode, _dconv_ uses direct convolution to create the result.  For small tables it can do this quite efficiently, however larger table require much more time to run. _dconv_ does (_isize_ * _ksmps_) multiplies on every k-cycle. Therefore, reverb and delay effects are best done with other opcodes (unless the times are short).

_dconv_ was designed to be used with time varying tables to facilitate new realtime filtering capabilities.

## Examples

Here is an example of the dconv opcode. It uses the file [dconv.csd](../examples/dconv.csd).

``` csound-csd title="Example of the dconv opcode." linenums="1"
--8<-- "examples/dconv.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: William &#8220;Pete&#8221; Moss<br>
2001<br>

New in version 4.12
