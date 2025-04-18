<!--
id:ifndef
category:Orchestra Syntax:Macros
-->
# &num;ifndef
Conditional reading of code.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

If the specified macro is not defined then _&num;ifndef_ can
incorporate text into an orchestra upto the next
_&num;end_.

## Syntax
``` csound-orc
#ifndef NAME
....
#else
....
#end
```

### Performance

Note that the _&num;ifndef_ can be nested, like in the C preprocessor language.

## Examples

Here is a simple example of the conditional.

``` csound-orc title="Simple example of the #ifndef form."
#define final ##
    instr 1
#ifndef final
    print "calling oscil"
#end
    a1   oscil 32000,440,1
    out  a1
    endin
```

## See also

[Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 2005<br>

New in Csound5 (and 4.23f13)
