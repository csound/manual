<!--
id:wgflute
category:Signal Generators:Waveguide Physical Modeling
-->
# wgflute
Creates a tone similar to a flute.

It uses a physical model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgflute(kamp, kfreq, kjet, iatt, idetk, kngain, kvibf, kvamp [, ifn] \
                   [, iminfreq] [, ijetrf] [, iendrf])
    ```

=== "Classic"
    ``` csound-orc
    ares wgflute kamp, kfreq, kjet, iatt, idetk, kngain, kvibf, kvamp [, ifn] \
                 [, iminfreq] [, ijetrf] [, iendrf]
    ```

### Initialization

_iatt_ -- time in seconds to reach full blowing pressure. 0.1 seems to correspond to reasonable playing.

_idetk_ -- time in seconds taken to stop blowing. 0.1 is a smooth ending

_ifn_ (optional) -- table of shape of vibrato, defaults to the usual sine table.

_iminfreq_ (optional) -- lowest frequency at which the instrument will play. If it is omitted it is taken to be the same as the initial kfreq. If _iminfreq_ is negative, initialization will be skipped.

_ijetrf_ (optional, default=0.5) -- amount of reflection in the breath jet that powers the flute. Default value is 0.5.

_iendrf_ (optional, default=0.5) -- reflection coefficient of the breath jet. Default value is 0.5. Both _ijetrf_ and _iendrf_ are used in the calculation of the pressure differential.

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played. While it can be varied in performance, I have not tried it.

_kjet_ -- a parameter controlling the air jet. Values should be positive, and about 0.3. The useful range is approximately 0.08 to 0.56.

_kngain_ -- amplitude of the noise component, about 0 to 0.5

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

## Examples

Here is an example of the wgflute opcode. It uses the file [wgflute.csd](../examples/wgflute.csd).

``` csound-csd title="Example of the wgflute opcode." linenums="1"
--8<-- "examples/wgflute.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

ifn optional in 6.06
