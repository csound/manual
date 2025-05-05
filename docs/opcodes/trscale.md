<!--
id:trscale
category:Spectral Processing:Streaming
-->
# trscale
Streaming partial track frequency scaling.

The _trscale_ opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by _partials_) and scales all frequencies by a k-rate amount. It can also, optionally, scale the gain of the signal by a k-rate amount (default 1). The result is pitch shifting of the input tracks.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = trscale(fin, kpitch [, kgain])
    ```

=== "Classic"
    ``` csound-orc
    fsig trscale fin, kpitch [, kgain]
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_fin_ -- input pv stream in TRACKS format

_kpitch_ -- frequency scaling

_kgain_ -- amplitude scaling (default 1)

## Examples

Here is an example of the trscale opcode. It uses the file [trscale.csd](../examples/trscale.csd).

``` csound-csd title="Example of the trscale opcode." linenums="1"
--8<-- "examples/trscale.csd"
```

The example above shows partial tracking of an ifd-analysis signal and linear additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
February 2006 <br>

New in Csound 5.01
