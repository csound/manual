<!--
id:scoreline
category:Instrument Control:Invocation
-->
# scoreline
Issues one or more score line events from an instrument.

If _ktrig_ is 1 every k-period. It can handle strings in the same conditions as the standard score. Multi-line strings are accepted, using {{  }} to enclose the string.

## Syntax
=== "Modern"
    ``` csound-orc
    scoreline(Sin, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    scoreline Sin, ktrig
    ```

### Initialization

_&#8220;Sin&#8221;_ --  a string (in double-quotes or enclosed by {{ }}) containing one or more score events.

### Performance

_ktrig_ -- event trigger, 1 issues the score event, 0 bypasses it.

## Examples

Here is an example of the scoreline opcode. It uses the file [scoreline.csd](../examples/scoreline.csd).

``` csound-csd title="Example of the scoreline opcode." linenums="1"
--8<-- "examples/scoreline.csd"
```

You can use string opcodes like [sprintfk](../opcodes/sprintfk.md) to produce strings to be passed to _scoreline_ like this:

``` csound-orc
Sfil    = "/Volumes/Bla/file.aif"
String  sprintfk {{i 2 0 %f "%s" %f %f %f %f}}, idur, Sfil, p5, p6, knorm, iskip
        scoreline String, ktrig
```

## See also

[Instrument Invocation](../control/invocat.md)

More information on this opcode: [http://www.csoundjournal.com/issue15/phrase_loops.html](http://www.csoundjournal.com/issue15/phrase_loops.html) written by Jim Aikin, and in the Floss Manuals: [https://flossmanual.csound.com/csound-language/live-events](https://flossmanual.csound.com/csound-language/live-events).

## Credits

Author: Victor Lazzarini, 2007
