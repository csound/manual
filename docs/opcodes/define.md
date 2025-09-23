<!--
id:define
category:Orchestra Syntax:Macros
-->
# &num;define
Defines a macro.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

_&num;define NAME_ -- defines a simple macro. The name of the macro must begin with a letter and can consist of any combination of letters and numbers. Case is significant. This form is limiting, in that the variable names are fixed.  More flexibility can be obtained by using a macro with arguments, described below.

_&num;define NAME_(_a&apos; b&apos; c&apos;_) -- defines a macro with arguments. This can be used in more complex situations. The name of the macro must begin with a letter and can consist of any combination of letters and numbers. Within the replacement text, the arguments can be substituted by the form: &dollar;A.  In fact, the implementation defines the arguments as simple macros.  The names may be any choice of letters.  Remember that case is significant in macro names.

> :memo: **Note**
>
> In earlier versions of Csound there was a limit of 5 arguments, but this restriction was removed in 2011; memory is the only constraint.

## Syntax
``` csound-orc
#define NAME # replacement text #
#define NAME(a' b' c') # replacement text #
```

### Initialization

_&num; replacement text &num;_ --  The replacement text is any character string (not containing a &num;) and can extend over multiple lines. The replacement text is enclosed within the &num; characters, which ensure that additional characters are not inadvertently captured.

### Performance

Some care is needed with textual replacement macros, as they can sometimes do strange things.  They take no notice of any meaning, so spaces are significant. This is why, unlike the C programming language, the definition has the replacement text surrounded by &num; characters. Used carefully, this simple macro system is a powerful concept, but it can be abused.

## Examples

Here is a simple example of the defining a macro. It uses the file [define.csd](../examples/define.csd).

``` csound-csd title="Simple example of the define macro." linenums="1"
--8<-- "examples/define.csd"
```

Its output should include lines like this:

```
Macro definition for VOLUME
Macro definition for CPS
Macro definition for TABLE
```

Here is an example of the defining a macro with arguments. It uses the file [define_args.csd](../examples/define_args.csd).

``` csound-csd title="Example of the define macro with arguments." linenums="1"
--8<-- "examples/define_args.csd"
```

Its output should include lines like this:

```
Macro definition for OSCMACRO
```

Predefined Math Constant Macros

New in Csound 5.04 are predefined Math Constant Macros.  The values
defined are those found in the C header math.h, and are automatically
defined when Csound starts and available for use in orchestras.

| Macro | Value | Equivalent to |
|---|---|---|
| $M_E | 2.7182818284590452354 | e |
| $M_LOG2E | 1.4426950408889634074 | log_2(e) |
| $M_LOG10E | 0.43429448190325182765 | log_10(e) |
| $M_LN2 | 0.69314718055994530942 | log_e(2) |
| $M_LN10 | 2.30258509299404568402 | log_e(10) |
| $M_PI | 3.14159265358979323846 | pi |
| $M_PI_2 | 1.57079632679489661923 | pi/2 |
| $M_PI_4 | 0.78539816339744830962 | pi/4 |
| $M_1_PI | 0.31830988618379067154 | 1/pi |
| $M_2_PI | 0.63661977236758134308 | 2/pi |
| $M_2_SQRTPI | 1.12837916709551257390 | 2/sqrt(pi) |
| $M_SQRT2 | 1.41421356237309504880 | sqrt(2) |
| $M_SQRT1_2 | 0.70710678118654752440 | 1/sqrt(2) |

## See also

[Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 1998<br>

Examples written by Kevin Conder.

New in Csound version 3.48
