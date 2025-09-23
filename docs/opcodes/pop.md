<!--
id:pop
category:Instrument Control:Stacks
-->
# pop
Pops values from the global stack.  Deprecated.

Plugin opcode in stackops.

## Syntax
=== "Modern"
    ``` csound-orc
    xval1, [xval2, ... , xval31] = pop()
    ival1, [ival2, ... , ival31] = pop()
    ```

=== "Classic"
    ``` csound-orc
    xval1, [xval2, ... , xval31] pop
    ival1, [ival2, ... , ival31] pop
    ```

### Initialization

_ival1 ... ival31_  - values to be popped from the stack.

### Performance

_xval1 ... xval31_  - values to be popped from the stack.

The given values are poped from  the stack. The global stack works in LIFO order: after multiple [push](../opcodes/push.md) calls, _pop_ should be used in reverse order.

Each [push](../opcodes/push.md) or _pop_ operation can work on a "bundle" of multiple variables. When using _pop_, the number, type, and order of items must match those used by the corresponding [push](../opcodes/push.md). That is, after a 'push Sfoo, ibar', you must call something like 'Sbar, ifoo pop', and not e.g. two separate 'pop' statements.

[push](../opcodes/push.md) and _pop_ opcodes can take variables of any type (i-, k-, a- and strings). Use of any combination of i, k, a, and S types is allowed. Variables of type 'a' and 'k' are passed at performance time only, while 'i' and 'S' are passed at init time only.

push/pop for a, k, i, and S types copy data by value. By contrast, [push_f](../opcodes/push_f.md) only pushes a "reference" to the f-signal, and then the corresponding [pop_f](../opcodes/pop_f.md) will copy directly from the original variable to its output signal. For this reason, changing the source f-signal of [push_f](../opcodes/push_f.md) before [pop_f](../opcodes/pop_f.md) is called is not recommended, and if the instrument instance owning the variable that was passed by push_f is deactivated before pop_f is called, undefined behavior may occur.

Any stack errors (trying to push when there is no more space, or pop from an empty stack, inconsistent number or type of arguments, etc.) are fatal and terminate performance.

## Examples

Here is an example of the pop opcode. It uses the file [pop.csd](../examples/pop.csd).

``` csound-csd title="Example of the pop opcode." linenums="1"
--8<-- "examples/pop.csd"
```

## See also

[Stacks](../control/stacks.md)

Using this opcode is somewhat hackish, as you can read here: [http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html](http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html).

## Credits

By: Istvan Varga.<br>
2006

Deprecated as of version 6.04.
