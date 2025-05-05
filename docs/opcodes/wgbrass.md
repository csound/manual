<!--
id:wgbrass
category:Signal Generators:Waveguide Physical Modeling
-->
# wgbrass
Creates a tone related to a brass instrument.

It uses a physical model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgbrass(kamp, kfreq, ktens, iatt, kvibf, kvamp [, ifn] [, iminfreq])
    ```

=== "Classic"
    ``` csound-orc
    ares wgbrass kamp, kfreq, ktens, iatt, kvibf, kvamp [, ifn] [, iminfreq]
    ```

### Initialization

_iatt_ -- time taken to reach full pressure

_ifn_ -- optional table of shape of vibrato, defaults to a sine table.

_iminfreq_ -- lowest frequency at which the instrument will play. If it is omitted it is taken to be the same as the initial _kfreq_. If _iminfreq_ is negative, initialization will be skipped.

### Performance

A note is played on a brass-like instrument, with the arguments as below.

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_ktens_ -- lip tension of the player. Suggested value is about 0.4

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

> :warning: **NOTE**
>
> This is rather poor, and at present uncontrolled. Needs revision, and possibly more parameters.


## Examples

Here is an example of the wgbrass opcode. It uses the file [wgbrass.csd](../examples/wgbrass.csd).

``` csound-csd title="Example of the wgbrass opcode." linenums="1"
--8<-- "examples/wgbrass.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

ifn optional in 6.06
