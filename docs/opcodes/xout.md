<!--
id:xout
category:Signal I/O:Software Bus
-->
# xout
Retrieves variables from a user-defined opcode block.

The _xin_ and _xout_ opcodes copy variables to and from the opcode definition, allowing communication with the calling instrument.

The types of input and output variables are defined by the parameters _intypes_ and _outtypes_.

> :memo: **Notes**
>
> * _xin_ and _xout_ should be called only once, and _xin_ should precede _xout_, otherwise an init error and deactivation of the current instrument may occur.
> * These opcodes actually run only at i-time. Performance time copying is done by the user opcode call. This means that skipping _xin_ or _xout_ with [kgoto](../opcodes/kgoto.md) has no effect, while skipping with [igoto](../opcodes/igoto.md) affects both init and performance time operation.

## Syntax
=== "Modern"
    ``` csound-orc
    xout(xoutarg1 [, xoutarg2] ... [, xoutargN])
    ```

=== "Classic"
    ``` csound-orc
    xout xoutarg1 [, xoutarg2] ... [, xoutargN]
    ```

### Performance

_xoutarg1_, _xoutarg2_, ... - output arguments. The number and type of variables must agree with the user-defined opcode's _outtypes_ declaration. However, _xout_ does not check for incorrect use of init-time and control-rate variables.

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

```
[xinarg1] [, xinarg2] ... [xinargN]  name  [xoutarg1] [, xoutarg2] ... \
                                           [xoutargN] [, iksmps]
```

## Examples

See the example for the [opcode](../opcodes/opcode.md) opcode.

## See Also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

## Credits

Author: Istvan Varga, 2002; based on code by Matt J. Ingalls

New in version 4.22
