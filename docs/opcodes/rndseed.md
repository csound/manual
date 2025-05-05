<!--
id:rndseed
category:Signal Generators:Random (Noise) Generators
-->
# rndseed
Sets the global seed value for [rnd](../opcodes/rnd.md) and [birnd](../opcodes/birnd.md).

## Syntax
=== "Modern"
    ``` csound-orc
    rndseed(ival)
    ```

=== "Classic"
    ``` csound-orc
    rndseed ival
    ```

### Initialization

_ival_ (default=0.5) -- should be between 0 and 1.

Use of _rndseed_ will provide alternative results from the rnd and birnd opcodes to the default (= 0.5).

## Examples

Here is an example of the rndseed opcode. It uses the file [rndseed.csd](../examples/rndseed.csd).

``` csound-orc title="Example of the rndseed opcode." linenums="1"
--8<-- "examples/rndseed.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch<br>
April 2020<br>

New in Csound version 6.15
