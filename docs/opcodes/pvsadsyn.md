<!--
id:pvsadsyn
category:Spectral Processing:Streaming
-->
# pvsadsyn
Resynthesize using a fast oscillator-bank.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pvsadsyn(fsrc, inoscs, kfmod [, ibinoffset] [, ibinincr] [, iinit])
    ```

=== "Classic"
    ``` csound-orc
    ares pvsadsyn fsrc, inoscs, kfmod [, ibinoffset] [, ibinincr] [, iinit]
    ```

### Initialization

_inoscs_ -- The number of analysis bins to synthesise. Cannot be larger than the size of fsrc (see [pvsinfo](../opcodes/pvsinfo.md)), e.g. as created by [pvsanal](../opcodes/pvsanal.md).  Processing time is directly proportional to inoscs.

_ibinoffset_ (optional, default=0) -- The first (lowest) bin to resynthesise, counting from 0 (default = 0).

_ibinincr_ (optional) -- Starting from bin ibinoffset, resynthesize bins ibinincr apart.

_iinit_ (optional) --  Skip reinitialization. This is not currently implemented for any of these opcodes, and it remains to be seen if it is even practical.

### Performance

_kfmod_ -- Scale all frequencies by factor kfmod. 1.0 = no change, 2 =  up one octave.

_pvsadsyn_ is experimental, and implements the oscillator bank using a fast direct calculation method, rather than a lookup table. This takes advantage of the fact, empirically arrived at, that for the analysis rates generally used, (and presuming analysis using [pvsanal](../opcodes/pvsanal.md), where frequencies in a bin change only slightly between frames) it is not necessary to interpolate frequencies between frames, only amplitudes. Accurate resynthesis is often contingent on the use of pvsanal with iwinsize = ifftsize*2.

This opcode is the most likely to change, or be much extended, according to feedback and advice from users. It is likely that a full interpolating table-based method will be added, via a further optional iarg. The parameter list to pvsadsyn mimics that for [pvadd](../opcodes/pvadd.md), but excludes spectral extraction.

## Examples

Here is an example of the pvsadsyn opcode. It uses the file [pvsadsyn.csd](../examples/pvsadsyn.csd).

``` csound-csd title="Example of the pvsadsyn opcode." linenums="1"
--8<-- "examples/pvsadsyn.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13
