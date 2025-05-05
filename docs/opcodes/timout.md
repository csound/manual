<!--
id:timout
category:Instrument Control:Program Flow Control
-->
# timout
Conditional branch during p-time depending on elapsed note time.

_istrt_ and _idur_ specify time in seconds. The branch to _label_ will become effective at time _istrt_, and will remain so for just _idur_ seconds. Note that _timout_ can be reinitialized for multiple activation within a single note (see example under [reinit](../opcodes/reinit.md)).

## Syntax
=== "Modern"
    ``` csound-orc
    timout(istrt, idur, label)
    ```

=== "Classic"
    ``` csound-orc
    timout istrt, idur, label
    ```

where _label_ is in the same instrument block and is not an expression.

## Examples

Here is an example of the timout opcode. It uses the file [timout.csd](../examples/timout.csd).

``` csound-csd title="Example of the timout opcode." linenums="1"
--8<-- "examples/timout.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)
