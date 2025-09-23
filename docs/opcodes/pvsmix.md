<!--
id:pvsmix
category:Spectral Processing:Streaming
-->
# pvsmix
Mix 'seamlessly' two pv signals.

This opcode combines the most prominent components of two pvoc streams into a single mixed stream.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmix(fsigin1, fsigin2)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmix fsigin1, fsigin2
    ```

### Performance

_fsig_ -- output pv stream

_fsigin1_ -- input pv stream.

_fsigin2_ -- input pv stream, which must have same format as _fsigin1_.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsmix opcode. It uses the file [pvsmix.csd](../examples/pvsmix.csd).

``` csound-csd title="Example of the pvsmix opcode." linenums="1"
--8<-- "examples/pvsmix.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
