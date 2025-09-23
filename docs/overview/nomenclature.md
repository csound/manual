# Nomenclature

Throughout this manual, opcodes as well as their argument and result mnemonics, when mentioned in the text, are given in *italics*. Argument names are generally mnemonic (*amp*, *phs*), and the result is usually denoted by the letter `r`. Both are preceded by a type qualifier `i`, `k`, `a`, or `x` (e.g. `kamp`, `iphs`, `ar`, `xphs`). The prefix `i` denotes scalar values valid at note init time; prefixes `k` or `a` denote control (scalar) and audio (vector) values, modified and referenced continuously throughout performance (i.e. at every control period while the instrument is active). Arguments are used at the prefix-listed times; results are created at their listed times, then remain available for use as inputs elsewhere. With few exceptions, argument rates may not exceed the rate of the result. The validity of inputs is defined by the following:

- arguments with prefix `i` must be valid at init time;  
- arguments with prefix `k` can be either control or init values (which remain valid);  
- arguments with prefix `a` must be audio vector inputs;  
- arguments with prefix `x` may be either vector or scalar (the compiler will distinguish).

Arguments with `[]` are arrays. The distinction between `i`, `k` and `a` also applies here, e.g. `iargs[]`, `kres[]` or `ares[]`.

All arguments, unless otherwise stated, can be expressions whose results conform to the above. Most opcodes (such as `linen` and `oscili`) can be used in more than one mode, which one being determined by the prefix of the result symbol.

Thoughout this manual, the term "opcode" is used to indicate a command that usually produces an a-, k-, i-rate output, and always forms the basis of a complete Csound orchestra statement. Items such as `+` or `sin(x)` or, `( a >= b ? c : d)` are called "operators".
