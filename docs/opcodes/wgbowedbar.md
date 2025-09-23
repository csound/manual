<!--
id:wgbowedbar
category:Signal Generators:Waveguide Physical Modeling
-->
# wgbowedbar
A physical model of a bowed bar.

It belongs to the Perry Cook family of waveguide instruments.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wgbowedbar(kamp, kfreq, kpos, kbowpres, kgain [, iconst] [, itvel] \
                      [, ibowpos] [, ilow])
    ```

=== "Classic"
    ``` csound-orc
    ares wgbowedbar kamp, kfreq, kpos, kbowpres, kgain [, iconst] [, itvel] \
                    [, ibowpos] [, ilow]
    ```

### Initialization

_iconst_ (optional, default=0) -- an integration constant. Default is zero.

_itvel_ (optional, default=0) -- either 0 or 1. When _itvel_ = 0, the bow velocity follows an ADSR style trajectory. When _itvel_ = 1, the value of the bow velocity decays in an exponentially.

_ibowpos_ (optional, default=0) -- the position on the bow, which affects the bow velocity trajectory.

_ilow_ (optional, default=0) -- lowest frequency required

### Performance

_kamp_ -- amplitude of signal

_kfreq_ -- frequency of signal

_kpos_ -- position of the bow on the bar, in the range 0 to 1

_kbowpres_ -- pressure of the bow (as in _wgbowed_)

_kgain_ -- gain of filter. A value of about 0.809 is suggested.

## Examples

Here is an example of the wgbowedbar opcode. It uses the file [wgbowedbar.csd](../examples/wgbowedbar.csd).

``` csound-csd title="Example of the wgbowedbar opcode." linenums="1"
--8<-- "examples/wgbowedbar.csd"
```

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 4.07
