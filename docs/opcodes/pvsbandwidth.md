<!--
id:pvsbandwidth
category:Spectral Processing:Streaming
-->
# pvsbandwidth
Calculate the spectral bandwidth of a signal from its discrete Fourier transform.

## Syntax
=== "Modern"
    ``` csound-orc
    kbnd = pvsbandwidth(fsig)
    ```

=== "Classic"
    ``` csound-orc
    kbnd pvsbandwidth fsig
    ```

### Performance

_kbnd_ -- the spectral bandwidth

_fsig_ -- an input pv stream

## Examples

Here is an example of the use of the _pvsbandwidth_ opcode. It uses the file [pvsbandwidth.csd](../examples/pvsbandwidth.csd).

``` csound-csd title="Example of the pvsbandwidth opcode." linenums="1"
--8<-- "examples/pvsbandwidth.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
March 2020<br>
