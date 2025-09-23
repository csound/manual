<!--
id:miditempo
category:Instrument Control:Sensing and Control
-->
# miditempo
Returns the current tempo at k-rate, of either the MIDI file (if available) or the score. (provided the -t option is used).


## Syntax
=== "Modern"
    ``` csound-orc
    itempo = miditempo([id:i])
    ktempo = miditempo([id:i])
    ```

=== "Classic"
    ``` csound-orc
    itempo miditempo [id:i]
    ktempo miditempo [id:i]
    ```

### Initialization


_id_ (optional, default=0) -- MIDI file id, defaults to 0, the id of
any file passed to the -F flag.

Tempo is returned in bpm.

## Examples

Here is an example of the miditempo opcode. It uses the files [miditempo.csd](../examples/miditempo.csd).

``` csound-csd title="Example of the miditempo opcode." linenums="1"
--8<-- "examples/miditempo.csd"
```

Its output should include a line like this:

```
miditempo = 96
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Author: Istvan Varga<br>
March 2005<br>
New in Csound5<br>
