<!--
id:stack
category:Instrument Control:Stacks
-->
# stack
Initializes and sets the size of the global stack. Deprecated.

Plugin opcode in stackops.

## Syntax
=== "Modern"
    ``` csound-orc
    stack(iStackSize)
    ```

=== "Classic"
    ``` csound-orc
    stack iStackSize
    ```

### Initialization

_iStackSize_  - size of the stack in bytes.

### Performance

Csound implements a single global stack. Initializing the stack with the _stack_ opcode is not required - it is optional, and if not done, the first use of [push](../opcodes/push.md) or [push_f](../opcodes/push_f.md) will automatically create a stack of 32768 bytes. Otherwise, _stack_ is normally called from the orchestra header, and takes a stack size parameter in bytes (there is an upper limit of about 16 MB). Once set, the stack size is fixed and cannot be changed during performance.

The global stack works in LIFO order: after multiple [push](../opcodes/push.md) calls, [pop](../opcodes/pop.md) should be used in reverse order.

Each [push](../opcodes/push.md) or [pop](../opcodes/pop.md) operation can work on a "bundle" of multiple variables. When using [pop](../opcodes/pop.md), the number, type, and order of items must match those used by the corresponding [push](../opcodes/push.md). That is, after a 'push Sfoo, ibar', you must call something like 'Sbar, ifoo pop', and not e.g. two separate 'pop' statements.

[push](../opcodes/push.md) and [pop](../opcodes/pop.md) opcodes can take variables of any type (i-, k-, a- and strings). Variables of type 'a' and 'k' are passed at performance time only, while 'i' and 'S' are passed at init time only.

push/pop for a, k, i, and S types copy data by value. By contrast, [push_f](../opcodes/push_f.md) only pushes a "reference" to the f-signal, and then the corresponding [pop_f](../opcodes/pop_f.md) will copy directly from the original variable to its output signal. For this reason, changing the source f-signal of [push_f](../opcodes/push_f.md) before [pop_f](../opcodes/pop_f.md) is called is not recommended, and if the instrument instance owning the variable that was passed by push_f is deactivated before pop_f is called, undefined behavior may occur.

Any stack errors (trying to push when there is no more space, or pop from an empty stack, inconsistent number or type of arguments, etc.) are fatal and terminate performance.

## Examples

Here is an example of the stack opcode. It uses the file [stack.csd](../examples/stack.csd).

``` csound-csd title="Example of the stack opcode." linenums="1"
--8<-- "examples/stack.csd"
```

## See also

[Stacks](../control/stacks.md)

Using this opcode is somewhat hackish, as you can read here: [http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html](http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html).

## Credits

By: Istvan Varga.<br>
2006

Deprecated as of version 6.04.
