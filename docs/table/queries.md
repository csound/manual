# **Table Queries**

Opcodes to query tables for information are:

* For tables loaded from a sound file (using [GEN01](../../scoregens/gen01)): [ftchnls](../../opcodes/ftchnls), [ftcps](../../opcodes/ftcps), [ftexists](../../opcodes/ftexists), [ftlen](../../opcodes/ftlen), [ftlptim](../../opcodes/ftlptim) and [ftsr](../../opcodes/ftsr)
* For any table: [nsamp](../../opcodes/nsamp), [ftlen](../../opcodes/ftlen), [tableng](../../opcodes/tableng)

The opcode [tabsum](../../opcodes/tabsum) calculates the sum of values in a table. [getftargs](../../opcodes/getftargs) fills a string variable with the arguments used to create a function table at k-rate.
