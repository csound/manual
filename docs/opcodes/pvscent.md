<!--
id:pvscent
category:Spectral Processing:Streaming
-->
# pvscent
Calculate the spectral centroid of a signal from its discrete Fourier transform.

## Syntax
=== "Modern"
    ``` csound-orc
    kcent = pvscent(fsig)
    acent = pvscent(fsig)
    ```

=== "Classic"
    ``` csound-orc
    kcent pvscent fsig
    acent pvscent fsig
    ```

### Performance

_kcent_ -- the spectral centroid

_acent_ -- the spectral centroid

_fsig_ -- an input pv stream

## Examples

Here is an example of the use of the _pvscent_ opcode. It uses the file [pvscent.csd](../examples/pvscent.csd).

``` csound-csd title="Example of the _pvscent_ opcode." linenums="1"
--8<-- "examples/pvscent.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: John ffitch<br>
March 2005<br>

New plugin in version 5

March 2005.
