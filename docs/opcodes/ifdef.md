<!--
id:ifdef
category:Orchestra Syntax:Macros
-->
# &num;ifdef
Conditional reading of code.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

If a macro is defined then _&num;ifdef_ can incorporate text into an orchestra upto the next _&num;end_.

## Syntax
``` csound-orc
#ifdef NAME
....
#else
....
#end
```

### Performance

Note that the _&num;ifdef_ can be nested, like in the C preprocessor language.

## Examples

Here is a simple example of the conditional.

``` csound-orc title="Simple example of the #ifdef form."
#define debug ##
    instr 1
#ifdef debug
    print "calling oscil"
#end
    a1   oscil 32000,440,1
    out  a1
    endin
```

Here is another example of the #ifdef conditional. It uses the file [ifdef.csd](../examples/ifdef.csd).

``` csound-csd title="Detailed example of the #ifdef form." linenums="1"
--8<-- "examples/ifdef.csd"
```

## See also

[Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 2005<br>

New in Csound5 (and 4.23f13)
