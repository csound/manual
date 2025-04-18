# Orchestra Macros

Orchestra macros work like C preprocessor macros, and replace the content of the macro in the orchestra before it is compiled. The opcodes one can use to create, call, or undefine orchestra macros are:

* [#define](../opcodes/define.md)
* [$NAME](../opcodes/dollar.md)
* [#ifdef](../opcodes/ifdef.md)
* [#ifndef](../opcodes/ifndef.md)
* [#end](../opcodes/ifdef.md)
* [#else](../opcodes/ifdef.md)
* [#include](../opcodes/include.md)
* [#includestr](../opcodes/include.md)
* [#undef](../opcodes/undef.md)

Orchestra macros can also be defined using the command line flag [--omacro:](../invoke/cs-options-by-category.md#-omacroxxxyyy).

More information and examples on the usage of orchestra macros can be found in the entry for [#define](../opcodes/define.md).

These opcodes refer to orchestra macros; for score macros, refer to [Score Macros](../score/macros.md).

## Predefined Math Constant Macros

New in Csound 5.04 are predefined Math Constant Macros.  The values defined are those found in the C header math.h, and are automatically defined when Csound starts and available for use in orchestras.

| Macro       | Value                  | Equivalent to  |
|-------------|------------------------|----------------|
| $M_E        | 2.7182818284590452354  | $e$            |
| $M_LOG2E    | 1.4426950408889634074  | $log_2(e)$     |
| $M_LOG10E   | 0.43429448190325182765 | $log(e)$       |
| $M_LN2      | 0.69314718055994530942 | $ln(2)$        |
| $M_LN10     | 2.30258509299404568402 | $ln(10)$       |
| $M_PI       | 3.14159265358979323846 | $\pi$          |
| $M_PI_2     | 1.57079632679489661923 | $\pi/2$        |
| $M_PI_4     | 0.78539816339744830962 | $\pi/4$        |
| $M_1_PI     | 0.31830988618379067154 | $1/\pi$        |
| $M_2_PI     | 0.63661977236758134308 | $2/\pi$        |
| $M_2_SQRTPI | 1.12837916709551257390 | $2/\sqrt{\pi}$ |
| $M_SQRT2    | 1.41421356237309504880 | $\sqrt{2}$     |
| $M_SQRT1_2  | 0.70710678118654752440 | $1/\sqrt{2}$   |
