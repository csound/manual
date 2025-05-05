<!--
id:pvsinit
category:Spectral Processing:Streaming
-->
# pvsinit
Initialise a spectral (f) variable to zero.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsinit(isize [, iolap, iwinsize, iwintype, iformat])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsinit isize [, iolap, iwinsize, iwintype, iformat]
    ```

### Performance

_fsig_ -- output pv stream set to zero.

_isize_ -- size of the DFT frame.

_iolap_ -- size of the analysis overlap, defaults to _isize_/4.

_iwinsize_ -- size of the analysis window, defaults to _isize_.

_iwintype_ -- type of analysis window, defaults to 1, Hanning.

_iformat_ -- pvsdata format, defaults to 0:PVS_AMP_FREQ.

## Examples

Here is an example of the pvsinit opcode. It uses the file [pvsinit.csd](../examples/pvsinit.csd).

``` csound-csd title="Example of the pvsinit opcode." linenums="1"
--8<-- "examples/pvsinit.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
