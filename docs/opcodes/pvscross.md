<!--
id:pvscross
category:Spectral Processing:Streaming
-->
# pvscross
Performs cross-synthesis between two source fsigs.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvscross(fsrc, fdest, kamp1, kamp2)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvscross fsrc, fdest, kamp1, kamp2
    ```

### Performance

The operation of this opcode is identical to that of [pvcross](../opcodes/pvcross.md) (q.v.), except in using _fsig_s rather than analysis files, and the absence of spectral envelope preservation. The amplitudes from _fsrc_ and _fdest_ (using scale factors _kamp1_ for _fsrc_ and _kamp2_ for _fdest_) are applied to the frequencies of _fsrc_. _kamp1_ and _kamp2_ must not exceed the range 0 to 1.

With this opcode, cross-synthesis can be performed on real-time audio input, by using [pvsanal](../opcodes/pvsanal.md) to generate _fsrc_ and _fdest_. These must have the same format.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvscross_ opcode. It uses the file [pvscross.csd](../examples/pvscross.csd).

``` csound-csd title="Example of the _pvscross_ opcode." linenums="1"
--8<-- "examples/pvscross.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

November 2003. Thanks to Kanata Motohashi, fixed the link to the _pvcross_ opcode.

New in version 4.13
