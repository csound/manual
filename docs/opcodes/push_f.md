<!--
id:push_f
category:Instrument Control:Stacks
-->
# push_f
Pushes an f-sig frame into the global stack.  Deprecated.

Plugin opcode in stackops.

## Syntax
=== "Modern"
    ``` csound-orc
    push_f(fsig)
    ```

=== "Classic"
    ``` csound-orc
    push_f fsig
    ```

### Performance

_fsig _  - f-signal to be pushed into the stack.

The values are pushed into the global stack. The global stack works in LIFO order: after multiple _push_f_ calls, [pop_f](../opcodes/pop_f.md) should be used in reverse order.

push/pop for a, k, i, and S types copy data by value. By contrast, _push_f_ only pushes a "reference" to the f-signal, and then the corresponding [pop_f](../opcodes/pop_f.md) will copy directly from the original variable to its output signal. For this reason, changing the source f-signal of _push_f_ before [pop_f](../opcodes/pop_f.md) is called is not recommended, and if the instrument instance owning the variable that was passed by _push_f_ is deactivated before [pop_f](../opcodes/pop_f.md) is called, undefined behavior may occur.

[pop_f](../opcodes/pop_f.md) and _push_f_ can only take a single argument, and the data is passed both at init and performance time.

Any stack errors (trying to push when there is no more space, or pop from an empty stack, inconsistent number or type of arguments, etc.) are fatal and terminate performance.

## See also

[Stacks](../control/stacks.md)

## Credits

By: Istvan Varga.<br>
2006

Deprecated as of version 6.04.
