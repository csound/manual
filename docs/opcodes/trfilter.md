<!--
id:trfilter
category:Spectral Processing:Streaming
-->
# trfilter
Streaming partial track filtering.

The _trfilter_ opcode takes an input containg a TRACKS pv streaming signal (as generated, for instance by _partials_) and filters it using an amplitude response curve stored in a function table. The function table can have any size (no restriction to powers-of-two). The table lookup is done by linear-interpolation. It is possible to create time-varying filter curves by updating the amlitude response table with a table-writing opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = trfilter(fin, kamnt, ifn)
    ```

=== "Classic"
    ``` csound-orc
    fsig trfilter fin, kamnt, ifn
    ```

### Performance

_fsig_ -- output pv stream in TRACKS format

_fin_ -- input pv stream in TRACKS format

_kamnt_ -- amount of filtering (0-1)

_ifn_ -- function table number. This will contain an amplitude response curve, from 0 Hz to the Nyquist (table indexes 0 to N). Any size is allowed. Larger tables will provide a smoother amplitude response curve. Table reading uses linear interpolation.

## Examples

Here is an example of the trfilter opcode. It uses the file [trfilter.csd](../examples/trfilter.csd).

``` csound-csd title="Example of the trfilter opcode." linenums="1"
--8<-- "examples/trfilter.csd"
```

The example above shows partial tracking of an ifd-analysis signal and linear additive resynthesis with low-pass filtering.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini;<br>
February 2006 <br>

New in Csound 5.01
