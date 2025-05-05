<!--
id:setksmps
category:Signal I/O:Software Bus
-->
# setksmps
Sets the local ksmps value in an instrument or user-defined opcode block.

## Syntax
=== "Modern"
    ``` csound-orc
    setksmps(iksmps)
    ```

=== "Classic"
    ``` csound-orc
    setksmps iksmps
    ```

### Initialization

_iksmps_ -- sets the local ksmps value.

If _iksmps_ is set to zero, the _ksmps_ of the caller instrument or opcode is used (this is the default behavior).

> :memo: **Note**
>
> The local _ksmps_ is implemented by splitting up a control period into smaller sub-kperiods and setting up the instrument local ksmps to the new value. This also requires converting the rate of k-rate input and output arguments (input variables receive the same value in all sub-kperiods, while outputs are written only in the last one). It also means that you cannot use a local [ksmps](../opcodes/ksmps.md) that is higher than the global [ksmps](../opcodes/ksmps.md).

> :warning: **Warning about local ksmps**
>
> When the local _ksmps_ is not the same as the orchestra level _ksmps_ value (as specified in the orchestra header), global a-rate operations must be carefully coded to access the data in a vector according to the local ksmps. The audio rate bus channel opcodes (chnget/chnset) can be used freely, however, as they will do the necessary conversion between ksmp sizes.
>
> Other opcodes that require some care include:
>
> * any access to &#8220;ga&#8221; variables
> * a-rate zak opcodes ([zar](../opcodes/zar.md), [zaw](../opcodes/zaw.md), etc.)
> * [tablera](../opcodes/tablera.md) and [tablewa](../opcodes/tablewa.md) (these two opcodes may in fact work, but caution is needed)
> * The _in_ and _out_ opcode family cannot be used in local-ksmps UDOs (these read from, and write to global a-rate buffers), but are safe in local-ksmps instruments
>
> In general, the local _ksmps_ should be used with care as it is an experimental feature. Though it works correctly in most cases.

The _setksmps_ statement can be used to set the local [ksmps](../opcodes/ksmps.md) value of the instrument or user-defined opcode block. It has one i-time parameter specifying the new _ksmps_ value. _setksmps_ should be used before any other opcodes (but allowed after [xin](../opcodes/xin.md) in UDOs), otherwise unpredictable results may occur.

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

```
[xinarg1] [, xinarg2] ... [xinargN]  name  [xoutarg1] [, xoutarg2] ... [xoutargN]
```

## Examples

See the example for the [opcode](../opcodes/opcode.md) opcode.

## See Also

[User Defined Opcodes (UDO)](../orch/user-defined-opcodes.md)

## Credits

Author: Istvan Varga, 2002; based on code by Matt J. Ingalls; Modified by V Lazzarini for Csound 6

New in version 4.22
