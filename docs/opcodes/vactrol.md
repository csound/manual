<!--
id:vactrol
category:Instrument Control:Sensing and Control
-->
# vactrol
Envelope follower unit generator emmulating a Perkin Elmer Vactrole VTL5C3/2.


Plugin opcode in buchla

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vactrol(asig [iup, idown])
    ```

=== "Classic"
    ``` csound-orc
    ares vactrol asig [iup, idown]
    ```

Initialisation

_iup_ -- The rise time of the filter, which defaults to 20,

_idown_ -- The fall time of the filter, which defaults to 3000,

### Performance

_asig_ -- The signal from which to extract the envelope.

## Examples

Here is an example of the vactrol opcode. It uses the file [vactrol.csd](../examples/vactrol.csd).

``` csound-csd title="Example of the vactrol opcode." linenums="1"
--8<-- "examples/vactrol.csd"
```

This opcode can reduce zipper noise produced from complex envelope tracking as it smooths the transitions.

## See also

[Sensing and Control: Envelope followers](../control/sensing.md)

## Credits

Author: John ffitch<br>
after Julian Parker<br>
New in 6.04<br>
