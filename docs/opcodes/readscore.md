<!--
id:readscore
category:Instrument Control:Invocation
-->
# readscore
Read, preprocess and schedule a score from an input string.

Readscore will issue one or more score events. It can handle strings in the same conditions as the standard score, including preprocessing (carry, sort, ramp, etc). Multi-line strings are accepted, using {{  }} to enclose the string.

## Syntax
=== "Modern"
    ``` csound-orc
    readscore(Sin)
    ```

=== "Classic"
    ``` csound-orc
    readscore Sin
    ```

### Initialization

_&#8220;Sin&#8221;_ --  a string (in double-quotes or enclosed by {{ }}) containing one or more score events.

## Examples

Here is an example of the readscore opcode. It uses the file [readscore.csd](../examples/readscore.csd).

``` csound-csd title="Example of the readscore opcode." linenums="1"
--8<-- "examples/readscore.csd"
```

You can use string opcodes like [sprintfk](../opcodes/sprintfk.md) to produce strings to be passed to _readscore_ like this:

``` csound-orc
Sfil    = "/Volumes/Bla/file.aif"
String  sprintfk {{i 2 0 %f "%s" %f %f %f %f}}, idur, Sfil, p5, p6, knorm, iskip
        readscore String
```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: Victor Lazzarini, 2013
