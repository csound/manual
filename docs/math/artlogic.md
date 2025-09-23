# **Arithmetic and Logic Operations**

Opcodes that perform arithmetic and logic operations are:

* [$-$](../opcodes/subtracts.md)  
* [$+$](../opcodes/adds.md)  
* [&&](../opcodes/opand.md)  
* [$!$](../opcodes/opnot.md)  
* [$||$](../opcodes/opor.md)  
* [$*$](../opcodes/multiplies.md)  
* [$/$](../opcodes/divides.md)  
* [^](../opcodes/raises.md)  
* [&lt;&lt;](../opcodes/opbitshl.md)  
* [&gt;&gt;](../opcodes/opbitshr.md)
* [$\#$](../opcodes/opnonequiv.md)  
* [&](../opcodes/opbitand.md) 
* [$|$](../opcodes/opbitor.md)  
* [~](../opcodes/opbitnot.md) 
* [$\%$](../opcodes/modulus.md)
* [cmp](../opcodes/cmp.md)

## Precedence and Associativity

The following table shows the precendence and
associativity of arithmetic and logic operators.
Precendence is shown in ascending order, with the
least precedence first.

| Operator                              | Associatvity |
| :--------------------- | :--------   |
| \|\|     &&                                  | left               |
| \|                                       | left               |
| &                                     | left               |
| &lt; &gt; &lt;= &gt;= == !=  | left               |
| &lt;&lt; &gt;&gt;                   |  left              |
| + -                               | left   (right for unary)  |
| * / %                         | left               |
| ^                                       | left              |
| !                                        | right            |

See the [Conditional Values](../control/conditional.md) section and the [if](../opcodes/if.md) family of opcodes for usage of logical operators.
