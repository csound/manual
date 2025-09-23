<!--
id:tablei
category:Signal Generators:Table Access
-->
# tablei
Accesses table values by direct indexing with linear interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tablei(andx, ifn [, ixmode] [, ixoff] [, iwrap])
    ires = tablei(indx, ifn [, ixmode] [, ixoff] [, iwrap])
    kres = tablei(kndx, ifn [, ixmode] [, ixoff] [, iwrap])
    ```

=== "Classic"
    ``` csound-orc
    ares tablei andx, ifn [, ixmode] [, ixoff] [, iwrap]
    ires tablei indx, ifn [, ixmode] [, ixoff] [, iwrap]
    kres tablei kndx, ifn [, ixmode] [, ixoff] [, iwrap]
    ```

### Initialization

_ifn_ -- function table number. _tablei_ requires the extended guard point.

_ixmode_ (optional) -- index data mode. The default value is 0.

* 0 = raw index
* 1 = normalized (0 to 1)

_ixoff_ (optional) -- amount by which index is to be offset. For a table with origin at center, use tablesize/2 (raw) or .5 (normalized). The default value is 0.

_iwrap_ (optional) -- wraparound index flag. The default value is 0.

*  0 = nowrap (index &lt; 0 treated as index=0; index &gt; tablesize sticks at index=size)
*  1 = wraparound.

### Performance

_tablei_ is a interpolating unit in which the fractional part of index is used to interpolate between adjacent table entries. The smoothness gained by interpolation is at some small cost in execution time (see also [oscili](../opcodes/oscili.md), etc.), but the interpolating and non-interpolating units are otherwise interchangeable. Note that when _tablei_ uses a periodic index whose modulo _n_ is less than the power of 2 table length, the interpolation process requires that there be an (_n_ + 1)th table value that is a repeat of the 1st (see [f Statement](../scoregens/f.md) in score).

> :warning: **Warning**
> 
> Reading tables which contain stereo- or multichannel-information probably causes unwanted noise as the opcode interpolates between subsequent positions of the table regardless of the origin of its content. Usually just the content of one channel is expected. Consider using _loscilx_ instead.
>

## Examples

Here is an example of the tablei opcode. It uses the file [tablei.csd](../examples/tablei.csd).

``` csound-orc title="Example of the tablei opcode." linenums="1"
--8<-- "examples/tablei.csd"
```

## See Also

[Table Access](../siggen/tableacc.md)

More information on this opcode: [http://www.csoundjournal.com/issue12/genInstruments.html](http://www.csoundjournal.com/issue12/genInstruments.html)  , written by Jacob Joaquin
