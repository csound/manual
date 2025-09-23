<!--
id:tempoval
category:Instrument Control:Sensing and Control
-->
# tempoval
Reads the current value of the tempo.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = tempoval()
    ```

=== "Classic"
    ``` csound-orc
    kres tempoval
    ```

### Performance

_kres_ -- the value of the tempo. If you use a positive value with the [-t command-line flag](../invoke/cs-options-alphabetically.md#-t-num-temponum), _tempoval_ returns the percentage increase/decrease from the original tempo of 60 beats per minute. If you do not, its value will be 60 (for 60 beats per minute).

## Examples

Here is an example of the tempoval opcode. Remember, it only works if you use the [-t](../invoke/cs-options-alphabetically.md#-t-num-temponum) flag with Csound. It uses the file [tempoval.csd](../examples/tempoval.csd).

``` csound-csd title="Example of the tempoval opcode." linenums="1"
--8<-- "examples/tempoval.csd"
```

Since 120 beats per minute is a 50% increase over the original 60 beats per minute, its output should include lines like:

```
kval = 0.500000
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Example written by Kevin Conder.

New in version 4.15

December 2002. Thanks to Drake Wilson for pointing out unclear documentation.
