# Score Macros

Macros are textual replacements which are made in the score as it is being presented to the system. The macro system in Csound is a very simple one, and uses the characters # and $ to define and call macros. This can can allow for simpler score writing, and provide an elementary alternative to full score generation systems. The score macro system is similar to, but independent of, the macro system in the orchestra language.

*[#define](../opcodes/define.md) NAME* -- defines a simple macro. The name of the macro must begin with a letter and can consist of any combination of letters and numbers. Case is significant. This form is limiting, in that the variable names are fixed. More flexibility can be obtained by using a macro with arguments, described below.

*#define NAME(a' b' c')* -- defines a macro with arguments. This can be used in more complex situations. The name of the macro must begin with a letter and can consist of any combination of letters and numbers. Within the replacement text, the arguments can be substituted by the form: *$A*. In fact, the implementation defines the arguments as simple macros. There may be up to 5 arguments, and the names may be any choice of letters. Remember that case is significant in macro names.

*$NAME.* -- calls a defined macro. To use a macro, the name is used following a $ character. The name is terminated by the first character which is neither a letter nor a number. If it is necessary for the name to be immediately followed by a leter or digit, a period, which will be ignored, can be used to terminate the name. The string, *$NAME.*, is replaced by the replacement text from the definition. The replacement text can also include macro calls.

*[#undef](../opcodes/undef.md) NAME* -- undefines a macro name. If a macro is no longer required, it can be undefined with *#undef NAME*.

``` csound-sco
#define NAME # replacement text #

#define NAME(a' b' c') # replacement text #
          
            $NAME.

#undef  NAME
```

*# replacement text #* -- The replacement text is any character string (not containing a #) and can extend over mutliple lines. The replacement text is enclosed within the # characters, which ensure that additional characters are not inadvertently captured.

Some care is needed with textual replacement macros, as they can sometimes do strange things. They take no notice of any meaning, so spaces are significant. This is why, unlike the C programming language, the definition has the replacement text surrounded by # characters. Used carefully, this simple macro system is a powerful concept, but it can be abused.

## Use Cases

When writing a complex score it is sometimes all too easy to forget to what the various instrument numbers refer. One can use macros to give names to the numbers. For example

``` csound-sco
#define Flute  #i1#
#define Whoop  #i2#

$Flute.  0  10  4000  440
$Whoop.  5  1
```

A note-event has a set of p-fields which are repeated:

``` csound-sco title="Example 1. Simple Macro"
#define ARGS # 1.01 2.33 138#
i1 0 1 8.00  1000 $ARGS
i1 0 1 8.01  1500 $ARGS
i1 0 1 8.02  1200 $ARGS
i1 0 1 8.03  1000 $ARGS
```

This will get expanded before sorting into:

``` csound-sco
i1 0 1 8.00  1000 1.01 2.33 138
i1 0 1 8.01  1500 1.01 2.33 138
i1 0 1 8.02  1200 1.01 2.33 138
i1 0 1 8.03  1000 1.01 2.33 138
```

This can save typing, and is makes revisions easier. If there were two sets of p-fields one could have a second macro (there is no real limit on the number of macros one can define).

``` csound-sco
#define ARGS1 # 1.01 2.33 138#
#define ARGS2 # 1.41 10.33 1.00#
i1 0 1 8.00  1000 $ARGS1
i1 0 1 8.01  1500 $ARGS2
i1 0 1 8.02  1200 $ARGS1
i1 0 1 8.03  1000 $ARGS2
```

``` csound-sco title="Example 2. Macros with arguments"
#define ARG(A) # 2.345   1.03   $A   234.9#
i1 0 1 8.00 1000 $ARG(2.0)
i1 + 1 8.01 1200 $ARG(3.0)
```

which expands to

``` csound-sco
i1 0 1 8.00 1000 2.345   1.03   2.0   234.9
i1 + 1 8.01 1200 2.345   1.03   3.0   234.9
```
