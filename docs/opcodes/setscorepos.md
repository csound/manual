<!--
id:setscorepos
category:Instrument Control:Sensing and Control
-->
# setscorepos
Sets the playback position of the current score performance to a given position.

## Syntax
=== "Modern"
    ``` csound-orc
    setscorepos(ipos)
    ```

=== "Classic"
    ``` csound-orc
    setscorepos ipos
    ```

### Initialization

_ipos_ -- playback position in seconds.

## Examples

Here is an example of the setscorepos opcode. It uses the file [setscorepos.csd](../examples/setscorepos.csd).

``` csound-csd title="Example of the setscorepos opcode." linenums="1"
--8<-- "examples/setscorepos.csd"
```

## See also

[Sensing and Control: Score control](../control/sensing.md)

## Credits

Author: Victor Lazzarini<br>
2008<br>

New in Csound version 5.09
