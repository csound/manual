<!--
id:adsr
category:Signal Generators:Envelope Generators
-->
# adsr
Calculates the classical ADSR envelope using linear segments.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = adsr(iatt, idec, islev, irel [, idel])
    kres = adsr(iatt, idec, islev, irel [, idel])
    ```

=== "Classic"
    ``` csound-orc
    ares adsr iatt, idec, islev, irel [, idel]
    kres adsr iatt, idec, islev, irel [, idel]
    ```

### Initialization

_iatt_ -- duration of attack phase

_idec_ -- duration of decay

_islev_ -- level for sustain phase

_irel_ -- duration of release phase

_idel_ -- period of zero before the envelope starts

### Performance

The envelope generated is the range 0 to 1 and may need to be scaled further, depending on the amplitude required. If using [0dbfs](../opcodes/0dbfs.md) = 1, scaling down will probably be required since playing more than one note might result in clipping. If not using [0dbfs](../opcodes/0dbfs.md), scaling to a large amplitude (e.g. 32000) might be required.

The envelope may be described as:

<figure markdown="span">
![Picture of an ADSR envelope.](../images/adsr.png)
<figcaption>Picture of an ADSR envelope.</figcaption>
</figure>

The length of the sustain is calculated from the length of the note. This means _adsr_ is not suitable for use with MIDI events. The opcode [madsr](../opcodes/madsr.md) uses the [linsegr](../opcodes/linsegr.md) mechanism, and so can be used in MIDI applications.

_adsr_ is new in Csound version 3.49.

## Examples

=== "Modern"
    Here is an example of the adsr opcode. It uses the file [adsr-modern.csd](../examples/adsr-modern.csd).
    ``` csound-csd title="Example of the adsr opcode." linenums="1"
    --8<-- "examples/adsr-modern.csd"
    ```

=== "Classic"
    Here is an example of the adsr opcode. It uses the file [adsr.csd](../examples/adsr.csd).
    ``` csound-csd title="Example of the adsr opcode." linenums="1"
    --8<-- "examples/adsr.csd"
    ```

=== "Modern"
    Here is an example for the adsr-group, comparing the different adsr opcodes. It uses the file [adsr-group-modern.csd](../examples/adsr-group-modern.csd).
    ``` csound-csd title="Example of the adsr group." linenums="1"
    --8<-- "examples/adsr-group-modern.csd"
    ```

=== "Classic"
    Here is an example for the adsr-group, comparing the different adsr opcodes. It uses the file [adsr-group.csd](../examples/adsr-group.csd).
    ``` csound-csd title="Example of the adsr group." linenums="1"
    --8<-- "examples/adsr-group.csd"
    ```

## See Also

[Envelope Generators](../siggen/envelope.md)

## Credits

Author: John ffitch

New in version 3.49
