<!--
id:schedkwhennamed
category:Instrument Control:Invocation
-->
# schedkwhennamed
Similar to [schedkwhen](../opcodes/schedkwhen.md) but uses a named instrument at init-time.

## Syntax
=== "Modern"
    ``` csound-orc
    schedkwhennamed(ktrigger, kmintim, kmaxnum, "name", kwhen, kdur \
                    [, ip4] [, ip5] [...])
    ```

=== "Classic"
    ``` csound-orc
    schedkwhennamed ktrigger, kmintim, kmaxnum, "name", kwhen, kdur \
                    [, ip4] [, ip5] [...]
    ```

### Initialization

_ip4, ip5, ..._ -- Equivalent to p4, p5, etc., in a score [i statement](../scoregens/i.md)

### Performance

_ktrigger_ -- triggers a new score event. If _ktrigger_ is 0, no new event is triggered.

_kmintim_ -- minimum time between generated events, in seconds. If _kmintim_ is less than or equal to 0, no time limit exists.

_kmaxnum_ -- maximum number of simultaneous instances of named instrument allowed. If the number of existant instances of the named instrument is greater than or equal to _kmaxnum_, no new event is generated. If _kmaxnum_ is less than or equal to 0, it is not used to limit event generation.

_"name"_ -- the named instrument's name.

_kwhen_ -- start time of the new event. Equivalent to p2 in a score [i statement](../scoregens/i.md). Measured from the time of the triggering event. _kwhen_ must be greater than or equal to 0. If _kwhen_ greater than 0, the instrument will not be initialized until the actual time when it should start performing.

_kdur_ -- duration of event. Equivalent to p3 in a score [i statement](../scoregens/i.md). If _kdur_ is 0, the instrument will only do an initialization pass, with no performance. If _kdur_ is negative, a held note is initiated. (See [ihold](../opcodes/ihold.md) and [i statement](../scoregens/i.md).)

> :memo: **Note**
>
> While waiting for events to be triggered by _schedkwhennamed_, the performance must be kept going, or Csound may quit if no score events are expected. To guarantee continued performance, an [f0 statement](../scoregens/f.md) may be used in the score.

> :memo: **Note**
>
> Note that the _schedkwhennamed_ opcode cannot accept string p-fields. If you need to pass strings when instantiating an instrument, use the [scoreline](../opcodes/scoreline.md) or [scoreline_i](../opcodes/scoreline_i.md) opcode.

## Examples

Here is an example of the schedkwhennamed opcode. It uses the file [schedkwhennamed.csd](../examples/schedkwhennamed.csd).

``` csound-csd title="Example of the schedkwhennamed opcode." linenums="1"
--8<-- "examples/schedkwhennamed.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: Rasmus Ekman<br>
EMS, Stockholm, Sweden<br>

New in Csound version 4.23
