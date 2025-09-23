<!--
id:table3
category:Signal Generators:Table Access
-->
# table3
Accesses table values by direct indexing with cubic interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = table3(andx, ifn [, ixmode] [, ixoff] [, iwrap])
    ires = table3(indx, ifn [, ixmode] [, ixoff] [, iwrap])
    kres = table3(kndx, ifn [, ixmode] [, ixoff] [, iwrap])
    ```

=== "Classic"
    ``` csound-orc
    ares table3 andx, ifn [, ixmode] [, ixoff] [, iwrap]
    ires table3 indx, ifn [, ixmode] [, ixoff] [, iwrap]
    kres table3 kndx, ifn [, ixmode] [, ixoff] [, iwrap]
    ```

### Initialization

_ifn_ -- function table number.

_ixmode_ (optional) -- index data mode. The default value is 0.

* 0 = raw index
* 1 = normalized (0 to 1)

_ixoff_ (optional) -- amount by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or .5 (normalized). The default value is 0.

_iwrap_ (optional) -- wraparound index flag. The default value is 0.

*  0 = nowrap (index &lt; 0 treated as index=0; index &gt; tablesize sticks at index=size)
*  1 = wraparound.

### Performance

_table3_ is identical to [tablei](../opcodes/tablei.md), except that it uses cubic interpolation. (New in Csound version 3.50).

> :warning: **Warning**
> 
> Reading tables which contain stereo- or multichannel-information probably causes unwanted noise as the opcode interpolates between subsequent positions of the table regardless of the origin of its content. Usually just the content of one channel is expected. Consider using _loscilx_ instead.

## See Also

[Table Access](../siggen/tableacc.md)

More information on this opcode: [http://www.csoundjournal.com/issue12/genInstruments.html](http://www.csoundjournal.com/issue12/genInstruments.html)  , written by Jacob Joaquin
