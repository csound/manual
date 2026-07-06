<!--
id:opcode
category:Orchestra Syntax:Block Statements
-->
# opcode
Defines the start of user-defined opcode block.

## Defining opcodes

The _opcode_ and _endop_ statements allow defining a new opcode that can be used the same way as any of the built-in Csound opcodes, using
the Csound language itself. There are two declaration forms for UDOs: classic and modern.
Beside the different syntaxes, these forms may also imply different call semantics (see below).

A user-defined opcode definition or a its protype declaration must precede the instrument (or other opcode) from which it is used.
It is also possible to call the opcode from itself. Such recursive calls are limited by default to a depth of 1000,
but this can be adjusted by the `--recursion-depth=` option (see options).

Input and output arguments may be passed by copy or by reference (see _call semantics_ below). Some parameters are automatically copied at initialization:

* all p-fields up to and including the highest-numbered one referenced in the calling instrument
* extra time (see also [xtratim](../opcodes/xtratim.md), [linsegr](../opcodes/linsegr.md), and related opcodes). This may affect the operation of _linsegr_/_expsegr_/_linenr_/_envlpxr_ in the user-defined opcode block.
* MIDI parameters, if there are any.

Also, the release flag (see the [release](../opcodes/release.md) opcode) is copied at performance time.

Modifying the note duration in the opcode definition by assigning to _p3_, or using [ihold](../opcodes/ihold.md), [turnoff](../opcodes/turnoff.md), [xtratim](../opcodes/xtratim.md), [linsegr](../opcodes/linsegr.md), or similar opcodes will also affect the caller instrument. Changes to MIDI controllers (for example with [ctrlinit](../opcodes/ctrlinit.md)) will also apply to the instrument from which the opcode was called.

Use the [setksmps](../opcodes/setksmps.md) opcode to set the local [ksmps](../opcodes/ksmps.md) directly or
alternative [oversample]](../opcodes/oversample.md) and [undersample]](../opcodes/undersample.md) to set
local sampling/control rates, indirectly.

The [xin](../opcodes/xin.md) and [xout](../opcodes/xout.md) allow communication with the calling instrument. The former is
only required in classic UDO syntax


> :information_source: **Tip**
>
> You can create UDOs which take no inputs or outputs by using 0 instead of a string, or void instead of arguments/output types in the modern syntax for,

> :memo: **Notes**
>
> * _xin_ and _xout_ should be used only once, and _xin_ should precede _xout_.
> * These opcodes actually run only at i-time to set up the connections to the caller. Performance time copying or referencing is done by the user opcode call. This means that skipping _xin_ or _xout_ at perf time (e.g. with [kgoto](../opcodes/kgoto.md)) etc has no effect, while skipping at i-time (e.g. with [igoto](../opcodes/igoto.md)) affects both init and performance time operation.

## Syntax
=== "Modern"
    ``` csound-orc
    opcode name(arg:type, ...):(out-type,...) 
    ```

=== "Classic"
    ``` csound-orc
    opcode name, outtypes, intypes   
    ```
### Initialization

_name_ -- name of the opcode. It may consist of any combination of letters, digits, and underscore but should not begin with a digit. Opcodes may be overloaded, i.e. use the
same name with different arguments (numbers/types). Some reserved words (like _instr_ and _endin_) cannot be redefined.

_intypes_ -- list of input types, any combination of the characters: a, f, k, O, P, V, K, i, o, p, and j. A single 0 character can be used if there are no input arguments. Double quotes and delimiter characters (e.g. comma) are _not_ needed.

_arg:type_ -- comma-separated list of arguments with their types, void may be used in place of an empty list.

_out-type_ -- comma-separated list of output types (as expected by xout), void is used for an empty list.


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


Arrays are set by the relevant builtin type followed by square brackets ([]).
In addition to these, the second form of UDO declaration also allows for any other builtin or
user-defined types to be employed for input and output types. These are not supported
in the classic UDO form.

The maximum allowed number of output arguments is 256.

The input parameters can be read with _xin_, and the output is written by _xout_ opcode. Only one instance of these units is normally used.
 The number and type of arguments for _xin_ and _xout_ must be the same as in the declaration of the user-defined opcode block (see tables above).
Accessing the engine main input and output buffers through the _in_ and _out_ (etc) opcodes is discouraged.

### Performance

The syntax of a user-defined opcode block is as follows. Classic syntax:

```  csound-orc
opcode  name, outtypes, intypes
xinarg1 [, xinarg2] [, xinarg3] ... [xinargN]  xin
[setksmps  iksmps]
... the rest of the instrument's code.
xout  xoutarg1 [, xoutarg2] [, xoutarg3] ... [xoutargN]
```

Modern syntax:


``` csound-orc
opcode name(arg:type, ...):(out-type,...) 
// no need for xin - input arg variables  given at declaration
xout(outarg, ...)
endop
```

The new opcode can then be used like any other opcode in Csound:

``` csound-orc
[xoutarg1] [, xoutarg2] ... [xoutargN] name  [xinarg1] [, xinarg2] ... [xinargN]
[xoutarg1] [, xoutarg2] ... [xoutargN] = name([xinarg1] [, xinarg2] ... [xinargN])
```

> :memo: **Note**
>
> The opcode call is always executed both at initialization and performance time, even if there are no a- or k-rate arguments. If there are many user opcode calls that are known to have no effect at performance time in an instrument, then it may save some CPU time to jump over groups of such opcodes with [kgoto](../opcodes/kgoto.md).


## Call Semantics

The _classic_ form of the UDO declaration defines an opcode with pass-by-copy call semantics. This means all inputs are
copied into UDO local variables (through the xin opcode), and the outputs as given to xout are also copied to the caller.
This differs from built-in (binary-compiled) opcodes where the call semantics is pass-by-reference. In this case, the reference to
the variable is passed (its memory location), and no data is copied.

The new UDO form, defined by the function-style syntax, implements a similar pass-by-reference call semantics that
aligns with how built-in opcodes work. The main implications are that not data is copied, therefore there are
less overheads in the use of UDOs; the memory is shared, and so UDOs may modify external data directly.

Pass-by-copy is enforced on all cases where there are local ksmps or local sr/kr conditions (setksmps, oversample, undersample).

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

Author: originally introduced by Istvan Varga, 2002, based on code by Matt J. Ingalls;
extended/improved by V Lazzarini, Steven Yi. New UDO syntax/pass-by-reference by Steven Yi.

New in version 4.22
New UDO syntax in version 7.
