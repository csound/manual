<!--
id:scoreline_i
category:Instrument Control:Invocation
-->
# scoreline_i
Issues one or more score line events from an instrument at i-time.

It can handle strings in the same conditions as the standard score. Multi-line strings are accepted, using {{  }} to enclose the string.

## Syntax
=== "Modern"
    ``` csound-orc
    scoreline_i(Sin)
    ```

=== "Classic"
    ``` csound-orc
    scoreline_i Sin
    ```

### Initialization

_&#8220;Sin&#8221;_ --  a string (in double-quotes or enclosed by {{ }}) containing one or more score events.

## Examples

Here is an example of the scoreline_i opcode. It uses the file [scoreline_i.csd](../examples/scoreline_i.csd).

``` csound-csd title="Example of the scoreline_i opcode." linenums="1"
--8<-- "examples/scoreline_i.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

More information on this opcode: [http://www.csoundjournal.com/issue15/phrase_loops.html](http://www.csoundjournal.com/issue15/phrase_loops.html) written by Jim Aikin, and in the Floss Manuals: [https://flossmanual.csound.com/csound-language/live-events](https://flossmanual.csound.com/csound-language/live-events).

## Credits

Author: Victor Lazzarini, 2007
