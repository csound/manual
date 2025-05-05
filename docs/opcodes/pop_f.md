<!--
id:pop_f
category:Instrument Control:Stacks
-->
# pop_f
Pops an f-sig frame from the global stack.  Deprecated.

Plugin opcode in stackops.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pop_f()
    ```

=== "Classic"
    ``` csound-orc
    fsig pop_f
    ```

### Performance

_fsig _  - f-signal to be popped from the stack.

The values are popped the stack. The global stack must be initialized before used, and its size must be set. The global stack works in LIFO order: after multiple [push_f](../opcodes/push_f.md) calls, _pop_f_ should be used in reverse order.

push/pop for a, k, i, and S types copy data by value. By contrast, [push_f](../opcodes/push_f.md) only pushes a "reference" to the f-signal, and then the corresponding _pop_f_ will copy directly from the original variable to its output signal. For this reason, changing the source f-signal of [push_f](../opcodes/push_f.md) before _pop_f_ is called is not recommended, and if the instrument instance owning the variable that was passed by [push_f](../opcodes/push_f.md) is deactivated before _pop_f_ is called, undefined behavior may occur.

[push_f](../opcodes/push_f.md) and _pop_f_ can only take a single argument, and the data is passed both at init and performance time.

Any stack errors (trying to push when there is no more space, or pop from an empty stack, inconsistent number or type of arguments, etc.) are fatal and terminate performance.

## See also

[Stacks](../control/stacks.md)

## Credits

By: Istvan Varga.<br>
2006

Deprecated as of version 6.04.
