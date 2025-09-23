<!--
id:pvsfwrite
category:Spectral Processing:Streaming
-->
# pvsfwrite
Write a fsig to a PVOCEX file (which in turn can be read by _pvsfread_ or other programs that support PVOCEX file input).

## Syntax
=== "Modern"
    ``` csound-orc
    pvsfwrite(fsig, ifile)
    ```

=== "Classic"
    ``` csound-orc
    pvsfwrite fsig, ifile
    ```

### Initialization

_fsig_ -- fsig input data.

_ifile_ -- filename (a string in double-quotes) .

## Examples

Here is an example of the pvsfwrite opcode. It uses the file [pvsfwrite.csd](../examples/pvsfwrite.csd). This example uses realtime audio input.

``` csound-csd title="Example of the pvsfwrite opcode" linenums="1"
--8<-- "examples/pvsfwrite.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
