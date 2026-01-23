<!--
id:event_i
category:Instrument Control:Invocation
alias:event_i
-->
# eventi
Generates a score event from an instrument.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *event_i*.

## Syntax
=== "Modern"
    ``` csound-orc
    eventi("scorechar", iinsnum, idelay, idur, [, ip4] [, ip5] [, ...])
    eventi("scorechar", "insname", idelay, idur, [, ip4] [, ip5] [, ...])
    ```

=== "Classic"
    ``` csound-orc
    event_i "scorechar", iinsnum, idelay, idur, [, ip4] [, ip5] [, ...]
    event_i "scorechar", "insname", idelay, idur, [, ip4] [, ip5] [, ...]
    ```

### Initialization

_&#8220;scorechar&#8221;_ -- A string (in double-quotes) representing the first p-field in a score statement. This is usually [&#8220;e&#8221;](../scoregens/e.md), [&#8220;f&#8221;](../scoregens/f.md), or [&#8220;i&#8221;](../scoregens/i.md).

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_iinsnum_ -- The instrument to use for the event. This corresponds to the first p-field, p1, in a score statement.

_idelay_ -- When (in seconds) the event will occur from the current performance time. This corresponds to the second p-field, p2, in a score statement.

_idur_ -- How long (in seconds) the event will happen. This corresponds to the third p-field, p3, in a score statement.

_ip4, ip5, ..._ (optional) -- Parameters representing additional p-field in a score statement. It starts with the fourth p-field, p4.

### Performance

The event is added to the queue at initialisation time.

> :memo: **Note**
>
> Note that the _eventi_ opcode cannot accept string p-fields. If you need to pass strings when instantiating an instrument, use the [scoreline](../opcodes/scoreline.md) or [scorelinei](../opcodes/scoreline_i.md) opcode.

## Examples

=== "Modern"
    Here is an example of the eventi opcode. It uses the file [eventi.csd](../examples/eventi.csd).
    ``` csound-csd title="Example of the eventi opcode." linenums="1"
    --8<-- "examples/eventi.csd"
    ```

=== "Classic"
    Here is an example of the event_i opcode. It uses the file [event_i.csd](../examples/event_i.csd).
    ``` csound-csd title="Example of the event_i opcode." linenums="1"
    --8<-- "examples/event_i.csd"
    ```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Written by Istvan Varga.

New in Csound5
