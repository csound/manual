<!--
id:nchnls_hw
category:Miscellaneous
-->
# nchnls_hw
Returns the number of audio channels in the underlying hardware.

This does not necessarily correspond to the number of channels used by Csound (set by nchnls and nchnls_i).

## Syntax
=== "Modern"
    ``` csound-orc
    idacc, iadcc = nchnls_hw()
    ```

=== "Classic"
    ``` csound-orc
    idacc, iadcc nchnls_hw
    ```

### Initialization

On init-pass idacc will contain the number of channels in the output device, and iadcc, the number of input channels. These will correspond to the currently selected/in-use hardware devices.

## Examples

Here is an example of the nchnls_hw opcode. It uses the file [nchnls_hw.csd](../examples/nchnls_hw.csd).

``` csound-csd title="Example of the nchnls_hw opcode." linenums="1"
--8<-- "examples/nchnls_hw.csd"
```

The output should include lines like these:

```
on this machine:
number of outputs = 32
number of inputs = 32
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: Victor Lazzarini<br>
2016<br>

In version 6.07
