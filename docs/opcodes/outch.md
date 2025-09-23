<!--
id:outch
category:Signal I/O:Signal Output
-->
# outch
Writes multi-channel audio data, with user-controllable channels, to an external device or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    outch(kchan1, asig1 [, kchan2] [, asig2] [...])
    ```

=== "Classic"
    ``` csound-orc
    outch kchan1, asig1 [, kchan2] [, asig2] [...]
    ```

### Performance

_outch_ outputs _asig1_ on the channel determined by _kchan1_, _asig2_ on the channel determined by _kchan2_, etc.

> :memo: **Note**
>
> The highest number for _kchanX_ available for use with _outch_ depends on [nchnls](../opcodes/nchnls.md). If _kchanX_ is greater than _nchnls_, _asigX_ will be silent. Note that _outch_ will give a warning but not an error in this case.

## Examples

Here is an example of the outch opcode. It uses the file [outch.csd](../examples/outch.csd).

``` csound-csd title="Example of the outch opcode." linenums="1"
--8<-- "examples/outch.csd"
```

Here is another example of the outch opcode. It uses the file [outch-2.csd](../examples/outch-2.csd).

``` csound-csd title="Example of the outch opcode." linenums="1"
--8<-- "examples/outch-2.csd"
```

```
signal is sent to channel 5
signal is sent to channel 4
signal is sent to channel 3
signal is sent to channel 2
signal is sent to channel 1
signal is sent to channel 5
........
```

Here is another example of the outch opcode. It uses the file [outch-3.csd](../examples/outch-3.csd).

``` csound-csd title="Another example of the outch opcode." linenums="1"
--8<-- "examples/outch-3.csd"
```

## See also

[Signal Output](../sigio/output.md)

More information on this opcode: [http://www.csoundjournal.com/issue16/audiorouting.html](http://www.csoundjournal.com/issue16/audiorouting.html), written by Andreas Russo

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
