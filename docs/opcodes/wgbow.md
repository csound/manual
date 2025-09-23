<!--
id:wgbow
category:Signal Generators:Waveguide Physical Modeling
-->
# wgbow
Creates a tone similar to a bowed string.

It uses a physical model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgbow(kamp, kfreq, kpres, krat, kvibf, kvamp [, ifn] [, iminfreq])
    ```

=== "Classic"
    ``` csound-orc
    ares wgbow kamp, kfreq, kpres, krat, kvibf, kvamp [, ifn] [, iminfreq]
    ```

### Initialization

_ifn_ -- optional table of shape of vibrato, defaults to a sine table.

_iminfreq_ (optional) -- lowest frequency at which the instrument will play. If it is omitted it is taken to be the same as the initial _kfreq_. If _iminfreq_ is negative, initialization will be skipped.

### Performance

A note is played on a string-like instrument, with the arguments as below.

_kamp_ -- amplitude of note.

_kfreq_ -- frequency of note played.

_kpres_ -- a parameter controlling the pressure of the bow on the string. Values should be about 3. The useful range is approximately 1 to 5.

_krat_ -- the position of the bow along the string. Usual playing is about 0.127236. The suggested range is 0.025 to 0.23.

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

## Examples

Here is an example of the wgbow opcode. It uses the file [wgbow.csd](../examples/wgbow.csd).

``` csound-csd title="Example of the wgbow opcode." linenums="1"
--8<-- "examples/wgbow.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

ifn optional in version 6.06
