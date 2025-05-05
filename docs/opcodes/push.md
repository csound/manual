<!--
id:push
category:Instrument Control:Stacks
-->
# push
Pushes a value into the global stack.  Deprecated.

Plugin opcode in stackops.

## Syntax
=== "Modern"
    ``` csound-orc
    push(xval1, [xval2, ... , xval31])
    push(ival1, [ival2, ... , ival31])
    ```

=== "Classic"
    ``` csound-orc
    push xval1, [xval2, ... , xval31]
    push ival1, [ival2, ... , ival31]
    ```

### Initialization

_ival1 ... ival31 _  - values to be pushed into the stack.

### Performance

_xval1 ... xval31 _  - values to be pushed into the stack.

The given values are pushed into the global stack as a bundle. The global stack works in LIFO order: after multiple [push](../opcodes/push.md) calls, [pop](../opcodes/pop.md) should be used in reverse order.

Each _push_ or [pop](../opcodes/pop.md) operation can work on a "bundle" of multiple variables. When using [pop](../opcodes/pop.md), the number, type, and order of items must match those used by the corresponding _push_. That is, after a 'push Sfoo, ibar', you must call something like 'Sbar, ifoo pop', and not e.g. two separate 'pop' statements.

_push_ and [pop](../opcodes/pop.md) opcodes can take variables of any type (i-, k-, a- and strings). Use of any combination of i, k, a, and S types is allowed. Variables of type 'a' and 'k' are passed at performance time only, while 'i' and 'S' are passed at init time only.

push/pop for a, k, i, and S types copy data by value. By contrast, [push_f](../opcodes/push_f.md) only pushes a "reference" to the f-signal, and then the corresponding [pop_f](../opcodes/pop_f.md) will copy directly from the original variable to its output signal. For this reason, changing the source f-signal of [push_f](../opcodes/push_f.md) before [pop_f](../opcodes/pop_f.md) is called is not recommended, and if the instrument instance owning the variable that was passed by push_f is deactivated before pop_f is called, undefined behavior may occur.

Any stack errors (trying to push when there is no more space, or pop from an empty stack, inconsistent number or type of arguments, etc.) are fatal and terminate performance.

## Examples

Here is an example of the push opcode. It uses the file [push.csd](../examples/push.csd).

``` csound-csd title="Example of the push opcode." linenums="1"
--8<-- "examples/push.csd"
```

## See also

[Stacks](../control/stacks.md)

Using this opcode is somewhat hackish, as you can read here: [http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html](http://csound.1045644.n5.nabble.com/passing-a-string-to-a-UDO-td1099284.html).

## Credits

By: Istvan Varga.<br>
2006

Deprecated as of version 6.04.
