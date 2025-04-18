<!--
id:dollar
category:Orchestra Syntax:Macros
-->
# &dollar;NAME
Calls a defined macro.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

_&dollar;NAME_<br>
_&dollar;NAME._  -- calls a defined macro. To use a macro, the name is used following a &dollar; character. The name is terminated by the first character which is neither a letter nor a number. If it is necessary for the name to be followed by a letter or number, a period, which will be ignored, can be used to terminate the name. The string, _&dollar;NAME_., is replaced by the replacement text from the definition. The replacement text can also include macro calls.

## Syntax
``` csound-orc
$NAME
```

### Initialization

_&num; replacement text &num;_ --  The replacement text is any character string (not containing a &num;) and can extend over multiple lines. The replacement text is enclosed within the &num; characters, which ensure that additional characters are not inadvertently captured.

### Performance

Some care is needed with textual replacement macros, as they can sometimes do strange things.  They take no notice of any meaning, so spaces are significant. This is why, unlike the C programming language, the definition has the replacement text surrounded by &num; characters. Used carefully, this simple macro system is a powerful concept, but it can be abused.

## Examples

Here is an example of the calling a macro. It uses the file [define.csd](../examples/define.csd).

``` csound-csd title="An example of the calling a macro." linenums="1"
--8<-- "examples/define.csd"
```

Its output should include lines like this:

```
Macro definition for VOLUME
Macro definition for CPS
Macro definition for TABLE
```

Here is an example of the calling a macro with arguments. It uses the file [define_args.csd](../examples/define_args.csd).

``` csound-csd title="An example of the calling a macro with arguments." linenums="1"
--8<-- "examples/define_args.csd"
```

Its output should include a line like this:

```
Macro definition for OSCMACRO
```

## See also

[Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April, 1998<br>

Examples written by Kevin Conder.

New in Csound version 3.48
