<!--
id:wgclar
category:Signal Generators:Waveguide Physical Modeling
-->
# wgclar
Creates a tone similar to a clarinet.

It uses a physical model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgclar(kamp, kfreq, kstiff, iatt, idetk, kngain, kvibf, kvamp \
                  [, ifn] [, iminfreq])
    ```

=== "Classic"
    ``` csound-orc
    ares wgclar kamp, kfreq, kstiff, iatt, idetk, kngain, kvibf, kvamp \
                [, ifn] [, iminfreq]
    ```

### Initialization

_iatt_ -- time in seconds to reach full blowing pressure. 0.1 seems to correspond to reasonable playing. A longer time gives a definite initial wind sound.

_idetk_ -- time in seconds taken to stop blowing. 0.1 is a smooth ending

_ifn_ (optional) -- table of shape of vibrato, defaults yo te usual sine table.

_iminfreq_ (optional) -- lowest frequency at which the instrument will play. If it is omitted it is taken to be the same as the initial _kfreq_. If _iminfreq_ is negative, initialization will be skipped.

### Performance

A note is played on a clarinet-like instrument, with the arguments as below.

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kstiff_ -- a stiffness parameter for the reed. Values should be negative, and about -0.3. The useful range is approximately -0.44 to -0.18.

_kngain_ -- amplitude of the noise component, about 0 to 0.5

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

## Examples

Here is an example of the wgclar opcode. It uses the file [wgclar.csd](../examples/wgclar.csd).

``` csound-csd title="Example of the wgclar opcode." linenums="1"
--8<-- "examples/wgclar.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

ifn optional in 6.06
