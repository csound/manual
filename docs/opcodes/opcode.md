<!--
id:opcode
category:Orchestra Syntax:Block Statements
-->
# opcode
Defines the start of user-defined opcode block.

## Defining opcodes

The _opcode_ and _endop_ statements allow defining a new opcode that can be used the same way as any of the built-in Csound opcodes. These opcode blocks are very similar to instruments (and are, in fact, implemented as special instruments), but cannot be called as a normal instrument e.g. with the [i statements](../scoregens/i.md).

A user-defined opcode block must precede the instrument (or other opcode) from which it is used. But it is possible to call the opcode from itself. This allows recursion of any depth that is limited only by available memory.

Similarly to instruments, the variables and labels of a user-defined opcode block are local and cannot be accessed from the caller instrument (and the opcode cannot access variables of the caller, either).

Some parameters are automatically copied at initialization, however:

* all p-fields up to and including the highest-numbered one referenced in the calling instrument
* extra time (see also [xtratim](../opcodes/xtratim.md), [linsegr](../opcodes/linsegr.md), and related opcodes). This may affect the operation of _linsegr_/_expsegr_/_linenr_/_envlpxr_ in the user-defined opcode block.
* MIDI parameters, if there are any.

Also, the release flag (see the [release](../opcodes/release.md) opcode) is copied at performance time.

Modifying the note duration in the opcode definition by assigning to _p3_, or using [ihold](../opcodes/ihold.md), [turnoff](../opcodes/turnoff.md), [xtratim](../opcodes/xtratim.md), [linsegr](../opcodes/linsegr.md), or similar opcodes will also affect the caller instrument. Changes to MIDI controllers (for example with [ctrlinit](../opcodes/ctrlinit.md)) will also apply to the instrument from which the opcode was called.

Use the [setksmps](../opcodes/setksmps.md) opcode to set the local [ksmps](../opcodes/ksmps.md) value.

The [xin](../opcodes/xin.md) and [xout](../opcodes/xout.md) opcodes copy variables to and from the opcode definition, allowing communication with the calling instrument.

The types of input and output variables are defined by the parameters _intypes_ and _outtypes_.

> :information_source: **Tip**
>
> You can create UDOs which take no inputs or outputs by using 0 instead of a string.

> :memo: **Notes**
>
> * _xin_ and _xout_ should be called only once, and _xin_ should precede _xout_, otherwise an init error and deactivation of the current instrument may occur.
> * These opcodes actually run only at i-time. Performance time copying is done by the user opcode call. This means that skipping _xin_ or _xout_ with [kgoto](../opcodes/kgoto.md) has no effect, while skipping with [igoto](../opcodes/igoto.md) affects both init and performance time operation.

## Syntax
``` csound-orc
opcode name, outtypes, intypes
```

### Initialization

_name_ -- name of the opcode. It may consist of any combination of letters, digits, and underscore but should not begin with a digit. If an opcode with the specified name already exists, it is redefined (a warning is printed in such cases). Some reserved words (like _instr_ and _endin_) cannot be redefined.

_intypes_ -- list of input types, any combination of the characters: a, f, k, O, P, V, K, i, o, p, and j. A single 0 character can be used if there are no input arguments. Double quotes and delimiter characters (e.g. comma) are _not_ needed.

The meaning of the various _intypes_ is shown in the following table:

| Type | Description | Variable Types Allowed | Updated At |
|---|---|---|---|
| a | a-rate variable | a-rate | a-rate |
| f | f-sig variable | f-sig | k-rate |
| i | i-rate variable | i-rate | i-time |
| j | optional i-time, defaults to -1 | i-rate, constant | i-time |
| k | k-rate variable | k- and i-rate, constant | k-rate |
| O | optional k-rate variable, defaults to 0 | k- and i-rate, constant | k-rate |
| P | optional k-rate variable, defaults to 1 | k- and i-rate, constant | k-rate |
| V | optional k-rate variable, defaults to 0.5 | k- and i-rate, constant | k-rate |
| J | optional k-rate variable, defaults to -1 | k- and i-rate, constant | k-rate |
| K | k-rate with initialization | k- and i-rate, constant | i-time and k-rate |
| o | optional i-time, defaults to 0 | i-rate, constant | i-time |
| p | optional i-time, defaults to 1 | i-rate, constant | i-time |
| S | string variable | k- and i-rate string, constant | i-time and k-rate |

_outtypes_ -- list of output types. The format is the same as in the case of _intypes_.

Here are the available _outtypes_:

| Type | Description | Variable Types Allowed | Updated At |
|---|---|---|---|
| a | a-rate variable | a-rate | a-rate |
| f | f-sig variable | f-sig | k-rate |
| i | i-rate variable | i-rate | i-time |
| k | k-rate variable | k-rate | k-rate |
| K | k-rate with initialization | k-rate | i-time and k-rate |
| S | string variable | k- and i-rate string | i-time and k-rate |

The maximum allowed number of output arguments is 256.

The input parameters can be read with _xin_, and the output is written by _xout_ opcode. Only one instance of these units should be used, as _xout_ overwrites and does not accumulate the output. The number and type of arguments for _xin_ and _xout_ must be the same as in the declaration of the user-defined opcode block (see tables above).

### Performance

The syntax of a user-defined opcode block is as follows:

``` csound-orc
opcode  name, outtypes, intypes
xinarg1 [, xinarg2] [, xinarg3] ... [xinargN]  xin
[setksmps  iksmps]
... the rest of the instrument's code.
xout  xoutarg1 [, xoutarg2] [, xoutarg3] ... [xoutargN]
endop
```

The new opcode can then be used with the usual syntax:

``` csound-orc
[xoutarg1] [, xoutarg2] ... [xoutargN] name  [xinarg1] [, xinarg2] ... [xinargN]
```

> :memo: **Note**
>
> The opcode call is always executed both at initialization and performance time, even if there are no a- or k-rate arguments. If there are many user opcode calls that are known to have no effect at performance time in an instrument, then it may save some CPU time to jump over groups of such opcodes with [kgoto](../opcodes/kgoto.md).

## Examples

Here is an example of a user-defined opcode. It uses the file
[opcode.csd](../examples/opcode.csd).

``` csound-csd title="Example of a user-defined opcode." linenums="1"
--8<-- "examples/opcode.csd"
```

Here is another example of a user-defined opcode. It uses the file
[opcode_f.csd](../examples/opcode_f.csd).

``` csound-csd title="Second example of a user-defined opcode." linenums="1"
--8<-- "examples/opcode_f.csd"
```

## See Also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

## Credits

Author: Istvan Varga, 2002; based on code by Matt J. Ingalls

New in version 4.22
