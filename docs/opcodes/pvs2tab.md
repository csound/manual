<!--
id:pvs2tab
category:Spectral Processing:Streaming
-->
# pvs2tab
Copies spectral data to k-rate arrays (or t-variables). Also known as [pvs2array](pvs2array.md).

Copies a pvs frame to a t-variable. Currently only AMP+FREQ and AMP+PHASE formats allowed. Since t-vars are an earlier version of k-rate arrays, the opcode also works with these. The opcode pvs2array is an alias of this one.

## Syntax
=== "Modern"
    ``` csound-orc
    kframe = pvs2tab(tvar|kvar[], fsig)
    kframe = pvs2tab(kmags[], kfreqs[], fsig)
    ```

=== "Classic"
    ``` csound-orc
    kframe pvs2tab tvar|kvar[], fsig
    kframe pvs2tab kmags[], kfreqs[], fsig
    ```

### Performance

_kframe_ -- current copied frame number. It can be used to detect when a new frame has been copied.

_tvar|kvar[]_ -- t-variable or k-rate array containing the output. It is produced at every k-period, but may not contain a new frame, pvs frames are produced at their own frame rate that is independent of kr. Generally, this vector needs to be big enough to contain the frame samples, i.e. N+2 (N is the dft size). If smaller, only a portion of the frame will be copied; if bigger, unused points will exist at higher indexes.

_kmags[], kfreqs[]_ k-rate arrays containing magnitude and frequency values. These arrays need to be generally be of size N/2 + 1, where N is dft frame size. If smaller, only a portion of the pvs frame will be copied; if bigger, unused points will exist at higher indexes.

_fsig_ -- input fsig to be copied.

## Examples

``` csound-orc
karr[]  init    1026
a1      inch    1
fsig1   pvsanal a1, 1024,256,1024, 1
kframe  pvs2tab karr, fsig1
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

[Array-based spectral opcodes](../spectral/arrays.md)

## Credits

Author: Victor Lazzarini<br>
October 2011 <br>

New plugin in version 5

October 2011.
