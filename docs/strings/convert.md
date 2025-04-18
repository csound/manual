# **String Conversion Opcodes**

These opcodes convert string variables (note: most of the opcodes run at init time only, and have a version with a "k" suffix that runs at both init and performance time; exceptions to this rule include puts and strget):

* [strtod](../opcodes/strtod.md) and [strtodk](../opcodes/strtodk.md) - Converts string value to a floating point value at i-rate.
* [strtol](../opcodes/strtol.md) and [strtolk](../opcodes/strtolk.md) - Converts string value to signed integer at i-rate.
* [strchar](../opcodes/strchar.md) and [strchark](../opcodes/strchark.md) - Returns the ASCII code of a character in a string.
* [strlower](../opcodes/strlower.md) and [strlowerk](../opcodes/strlowerk.md) - Converts a string to lower case.
* [strupper](../opcodes/strupper.md) and [strupperk](../opcodes/strupperk.md) - Converts a string to upper case.
