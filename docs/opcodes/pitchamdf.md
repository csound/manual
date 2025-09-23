<!--
id:pitchamdf
category:Instrument Control:Sensing and Control
-->
# pitchamdf
Follows the pitch of a signal based on the AMDF method (Average Magnitude Difference Function).

Outputs pitch and amplitude tracking signals. The method is quite fast and should run in realtime. This technique usually works best for monophonic signals.

## Syntax
=== "Modern"
    ``` csound-orc
    kcps, krms = pitchamdf(asig, imincps, imaxcps [, icps] [, imedi] \
                           [, idowns] [, iexcps] [, irmsmedi])
    ```

=== "Classic"
    ``` csound-orc
    kcps, krms pitchamdf asig, imincps, imaxcps [, icps] [, imedi] \
                         [, idowns] [, iexcps] [, irmsmedi]
    ```

### Initialization

_imincps_ -- estimated minimum frequency (expressed in Hz) present in the signal

_imaxcps_ -- estimated maximum frequency present in the signal

_icps_ (optional, default=0) -- estimated initial frequency of the signal. If 0, icps = (_imincps_+_imaxcps_) / 2. The default is 0.

_imedi_ (optional, default=1) -- size of median filter applied to the output _kcps_. The size of the filter will be _imedi_*2+1. If 0, no median filtering will be applied. The default is 1.

_idowns_ (optional, default=1) -- downsampling factor for _asig_. Must be an integer. A factor of _idowns_ &gt; 1 results in faster performance, but may result in worse pitch detection. Useful range is 1 - 4. The default is 1.

_iexcps_ (optional, default=0) -- how frequently pitch analysis is executed, expressed in Hz.  If 0, _iexcps_ is set to _imincps_. This is usually reasonable, but experimentation with other values may lead to better results. Default is 0.

_irmsmedi_ (optional, default=0) -- size of median filter applied to the output _krms_. The size of the filter will be _irmsmedi_*2+1. If 0, no median filtering will be applied. The default is 0.

### Performance

_kcps_ -- pitch tracking output

_krms_ -- amplitude tracking output

_pitchamdf_ usually works best for monophonic signals, and is quite reliable if appropriate initial values are chosen. Setting _imincps_ and _imaxcps_ as narrow as possible to the range of the signal's pitch, results in better detection and performance.

Because this process can only detect pitch after an initial delay, setting _icps_ close to the signal's real initial pitch prevents spurious data at the beginning.

The median filter prevents _kcps_ from jumping. Experiment to determine the optimum value for _imedi_ for a given signal.

Other initial values can usually be left at the default settings. Lowpass filtering of _asig_ before passing it to _pitchamdf_, can improve performance, especially with complex waveforms.

## Examples

Here is an example of the pitchamdf opcode. It uses the file [pitchamdf.csd](../examples/pitchamdf.csd).

``` csound-csd title="Example of the pitchamdf opcode." linenums="1"
--8<-- "examples/pitchamdf.csd"
```

## See also

[Sensing and Control: Tempo and Pitch estimation](../control/sensing.md)

## Credits

Author: Peter Neub&auml;cker<br>
Munich, Germany<br>
August 1999<br>

New in Csound version 3.59
