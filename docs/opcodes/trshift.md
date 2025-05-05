<!--
id:trshift
category:Spectral Processing:Streaming
-->
# trshift
Streaming partial track frequency scaling.

The _trshift_ opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by _partials_) and shifts all frequencies by a k-rate frequency. It can also, optionally, scale the gain of the signal by a k-rate amount (default 1). The result is frequency shifting of the input tracks.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = trshift(fin, kpshift [, kgain])
    ```

=== "Classic"
    ``` csound-orc
    fsig trshift fin, kpshift [, kgain]
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_fin_ -- input pv stream in TRACKS format

_kshift_ -- frequency shift in Hz

_kgain_ -- amplitude scaling (default 1)

## Examples

Here is an example of the trshift opcode. It uses the file [trshift.csd](../examples/trshift.csd).

``` csound-csd title="Example of the trshift opcode." linenums="1"
--8<-- "examples/trshift.csd"
```

The example above shows partial tracking of an ifd-analysis signal and linear additive resynthesis with frequency shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
