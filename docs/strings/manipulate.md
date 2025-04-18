# **String Manipulation Opcodes**

These opcodes perform operations on string variables (note: most of the opcodes run at init time only, and have a version with a "k" suffix that runs at both init and performance time; exceptions to this rule include puts and strget):

* [evalstr](../opcodes/evalstr.md) - Evaluates a string containing Csound code, returning a value.
* [return](../opcodes/return.md) - Returns a value from an instrument.
* [strcpy](../opcodes/strcpy.md) and [strcpyk](../opcodes/strcpyk.md) - Assigns to a string variable.
* [strcat](../opcodes/strcat.md) and [strcatk](../opcodes/strcatk.md) - Concatenates strings, and stores the result in a variable.
* [strcmp](../opcodes/strcmp.md) and [strcmpk](../opcodes/strcmpk.md) - Compares strings.
* [strget](../opcodes/strget.md) - Assigns to a string variable, from [strset](../opcodes/strset.md) table at the specified index, or string score p-field.
* [strlen](../opcodes/strlen.md) and [strlenk](../opcodes/strlenk.md) - Returns the length of a string.
* [sprintf](../opcodes/sprintf.md) - printf-style formatted output conversion, storing the result in a string variable.
* [sprintfk](../opcodes/sprintfk.md) - printf-style formatted output conversion, storing the result in a string variable at k-rate.
* [puts](../opcodes/puts.md) - Prints a string constant or variable.
* [strindex](../opcodes/strindex.md) and [strindexk](../opcodes/strindexk.md) - Returns the first occurence of a string in another string.
* [strrindex](../opcodes/strrindex.md) and [strrindexk](../opcodes/strrindexk.md) - Returns the last occurence of a string in another string.
* [strsub](../opcodes/strsub.md) and [strsubk](../opcodes/strsubk.md) - Returns a substring of the input string.
* [strstrip](../opcodes/strstrip.md) - Strip whitespace from string.

  
[strfromurl](../opcodes/strfromurl.md) sets a string variable at initialization time to the value found from reading an URL.
