# **String Manipulation Opcodes**

These opcodes perform operations on string variables (note: most of the opcodes run at init time only, and have a version with a "k" suffix that runs at both init and performance time; exceptions to this rule include puts and strget):

* [evalstr](../../opcodes/evalstr) - Evaluates a string containing Csound code, returning a value.
* [return](../../opcodes/return) - Returns a value from an instrument.
* [strcpy](../../opcodes/strcpy) and [strcpyk](../../opcodes/strcpyk) - Assigns to a string variable.
* [strcat](../../opcodes/strcat) and [strcatk](../../opcodes/strcatk) - Concatenates strings, and stores the result in a variable.
* [strcmp](../../opcodes/strcmp) and [strcmpk](../../opcodes/strcmpk) - Compares strings.
* [strget](../../opcodes/strget) - Assigns to a string variable, from [strset](../../opcodes/strset) table at the specified index, or string score p-field.
* [strlen](../../opcodes/strlen) and [strlenk](../../opcodes/strlenk) - Returns the length of a string.
* [sprintf](../../opcodes/sprintf) - printf-style formatted output conversion, storing the result in a string variable.
* [sprintfk](../../opcodes/sprintfk) - printf-style formatted output conversion, storing the result in a string variable at k-rate.
* [puts](../../opcodes/puts) - Prints a string constant or variable.
* [strindex](../../opcodes/strindex) and [strindexk](../../opcodes/strindexk) - Returns the first occurence of a string in another string.
* [strrindex](../../opcodes/strrindex) and [strrindexk](../../opcodes/strrindexk) - Returns the last occurence of a string in another string.
* [strsub](../../opcodes/strsub) and [strsubk](../../opcodes/strsubk) - Returns a substring of the input string.
* [strstrip](../../opcodes/strstrip) - Strip whitespace from string.

  
[strfromurl](../../opcodes/strfromurl) sets a string variable at initialization time to the value found from reading an URL.
