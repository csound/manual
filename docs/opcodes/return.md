<!--
id:return
category:Instrument Control:Compilation
-->
# return
Returns a value from an instrument at i-time.

The value of a global instrument (instrument 0) can be retrieved after compilation by the evalstr opcode. The retrieval of values returned by other instruments is not yet implemented.

## Syntax
=== "Modern"
    ``` csound-orc
    return(ival)
    ```

=== "Classic"
    ``` csound-orc
    return ival
    ```

### Initialization

_ival_ --  a value to be returned by instrument.

## Examples

Here is a short example of _return_ with [evalstr](evalstr.md).

``` csound-orc
ival evalstr "return 2 + 2"
print ival
```

The complete example plays a bell arpeggio over a bass line, with stereo echoes and reverb. It builds on tjingboem's example from [issue #315](https://github.com/csound/manual/issues/315).

Instrument 2 builds a code string for each note. In that string, _return_ supplies a frequency to _evalstr_, which assigns it to _iFreq_. The console prints each returned frequency as the melody plays. The code in the string runs in the global space, even though instrument 2 calls _evalstr_.

Change the offsets in _iNotes_ to make a new melody, or change the roots in score field p4 to try a different chord sequence. Score field p5 raises the melody by octaves on the second pass.

It uses the file [return.csd](../examples/return.csd).

``` csound-csd title="A bell arpeggio using return and evalstr." linenums="1"
--8<-- "examples/return.csd"
```

## See Also

[evalstr](evalstr.md), [String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Victor Lazzarini, 2013
