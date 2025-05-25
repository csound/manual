<!--
id:opcodeinfo
category:Instrument Control:Initialization and Reinitialization
-->

# opcodeinfo
Prints information on an opcode definition and its overloads.


## Syntax
=== "Modern"
    ``` csound-orc
    opcodeinfo(opc:OpcodeDef)
    opcodeinfo(obj:Opcode)
    ```

=== "Classic"
    ``` csound-orc
    opcodeinfo opc:OpcodeDef 
    opcodeinfo obj:Opcode
    ```

### Initialization


_opc_ -- opcode definition

_obj_ -- opcode object

This opcode prints information on the various overloads (versions) defined for 
an opcode, or alternatively the input and output arguments of an opcode object. 
It can be used to select the correct overload for instantiation with
[create](../opcodes/create.md).

## Examples

Here is an example for opcodeinfo. It uses the file [opcodeinfo.csd](../examples/opcodeinfo.csd).

``` csound-csd title="Examples of the two create opcode overloads." linenums="1"
--8<-- "examples/opcodeinfo.csd"
```

This should print

```
oscili: 10 overloads
(0)	oscili.a	out-types: a	in-types: kkjo
(1)	oscili.kk	out-types: k	in-types: kkjo
(2)	oscili.ka	out-types: a	in-types: kajo
(3)	oscili.ak	out-types: a	in-types: akjo
(4)	oscili.aa	out-types: a	in-types: aajo
(5)	oscili.aA	out-types: a	in-types: kki[]o
(6)	oscili.kkA	out-types: k	in-types: kki[]o
(7)	oscili.kaA	out-types: a	in-types: kai[]o
(8)	oscili.akA	out-types: a	in-types: aki[]o
(9)	oscili.aaA	out-types: a	in-types: aai[]o
selected overload 3:
oscili.ak 	out-types: a	in-types: akjo 
```


## Credits


Author: Victor Lazzarini<br>
Maynooth University<br>
Ireland<br>
Csound 7, 2024<br>
