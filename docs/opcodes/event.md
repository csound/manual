<!--
id:event
category:Instrument Control:Invocation
-->
# event
Generates a score event from an instrument.

## Syntax
=== "Modern"
    ``` csound-orc
    event("scorechar", kinsnum, kdelay, kdur, [, kp4] [, kp5] [, ...])
    event("scorechar", "insname", kdelay, kdur, [, kp4] [, kp5] [, ...])
    ```

=== "Classic"
    ``` csound-orc
    event "scorechar", kinsnum, kdelay, kdur, [, kp4] [, kp5] [, ...]
    event "scorechar", "insname", kdelay, kdur, [, kp4] [, kp5] [, ...]
    ```

### Initialization

_&#8220;scorechar&#8221;_ -- A string (in double-quotes) representing the first p-field in a score statement. This is usually [&#8220;e&#8221;](../scoregens/e.md), [&#8220;f&#8221;](../scoregens/f.md), or [&#8220;i&#8221;](../scoregens/i.md).

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

### Performance

_kinsnum_ -- The instrument to use for the event. This corresponds to the first p-field, p1, in a score statement.

_kdelay_ -- When (in seconds) the event will occur from the current performance time. This corresponds to the second p-field, p2, in a score statement.

_kdur_ -- How long (in seconds) the event will happen. This corresponds to the third p-field, p3, in a score statement.

_kp4, kp5, ..._ (optional) -- Parameters representing additional p-field in a score statement. It starts with the fourth p-field, p4.

> :memo: **Note**
>
> Note that the _event_ opcode cannot accept string p-fields. If you need to pass strings when instantiating an instrument, use the [scoreline](../opcodes/scoreline.md) or [scoreline_i](../opcodes/scoreline_i.md) opcode.

## Examples

Here is an example of the event opcode. It uses the file [event.csd](../examples/event.csd).

``` csound-csd title="Example of the event opcode." linenums="1"
--8<-- "examples/event.csd"
```

Here is an example of the event opcode using a named instrument. It uses the file [event_named.csd](../examples/event_named.csd).

``` csound-csd title="Example of the event opcode using a named instrument." linenums="1"
--8<-- "examples/event_named.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Examples written by Kevin Conder.

New in version 4.17

Thanks goes to Matt Ingalls for helping to fix the example and to clarify the kwhen/kdelay parameter.
