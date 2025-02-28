# **String Conversion Opcodes**

These opcodes convert string variables (note: most of the opcodes run at init time only, and have a version with a "k" suffix that runs at both init and performance time; exceptions to this rule include puts and strget):

* [strtod](../../opcodes/strtod) and [strtodk](../../opcodes/strtodk) - Converts string value to a floating point value at i-rate.
* [strtol](../../opcodes/strtol) and [strtolk](../../opcodes/strtolk) - Converts string value to signed integer at i-rate.
* [strchar](../../opcodes/strchar) and [strchark](../../opcodes/strchark) - Returns the ASCII code of a character in a string.
* [strlower](../../opcodes/strlower) and [strlowerk](../../opcodes/strlowerk) - Converts a string to lower case.
* [strupper](../../opcodes/strupper) and [strupperk](../../opcodes/strupperk) - Converts a string to upper case.
