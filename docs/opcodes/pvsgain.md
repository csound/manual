<!--
id:pvsgain
category:Spectral Processing:Streaming
-->
# pvsgain
Scale the amplitude of a pv stream.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsgain(fsigin, kgain)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsgain fsigin, kgain
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream

_kgain_ -- amplitude scaling (defaults to 1).

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvsgain_ opcode. It uses the file [pvsgain.csd](../examples/pvsgain.csd).

``` csound-csd title="Example of the _pvsgain_ opcode." linenums="1"
--8<-- "examples/pvsgain.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
2011 <br>

New plugin in version 5

2011
