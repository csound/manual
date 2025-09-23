<!--
id:flanger
category:Signal Modifiers:Special Effects
-->
# flanger
A user controlled flanger.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = flanger(asig, adel, kfeedback [, imaxd])
    ```

=== "Classic"
    ``` csound-orc
    ares flanger asig, adel, kfeedback [, imaxd]
    ```

### Initialization

_imaxd_(optional) -- maximum delay in seconds (needed for inital memory allocation)

### Performance

_asig_ -- input signal

_adel_ -- delay in seconds

_kfeedback_ -- feedback amount (in normal tasks this should not exceed 1, even if bigger values are allowed)

This unit is useful for generating choruses and flangers. The delay must be varied at a-rate, for example by connecting _adel_ to an oscillator output. The feedback can vary at k-rate.  This opcode is implemented to allow _kr_ different than _sr_ (else delay could not be lower than _ksmps_) enhancing realtime performance. This unit is very similar to [wguide1](../opcodes/wguide1.md), the only difference is _flanger_ does not have the lowpass filter or the requirement that the delay be varied at a-rate.

## Examples

Here is an example of the flanger opcode. It uses the file [flanger.csd](../examples/flanger.csd).

``` csound-csd title="Example of the flanger opcode." linenums="1"
--8<-- "examples/flanger.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

More information on flanging on Wikipedia: [http://en.wikipedia.org/wiki/Flanger](http://en.wikipedia.org/wiki/Flanger)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.49
