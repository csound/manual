<!--
id:vcella
category:Vectorial:Cellular Automata
-->
# vcella
Cellular Automata.

Unidimensional Cellular Automata applied to Csound vectors

## Syntax
=== "Modern"
    ``` csound-orc
    vcella(ktrig, kreinit, ioutFunc, initStateFunc, \
           iRuleFunc, ielements, irulelen [, iradius])
    ```

=== "Classic"
    ``` csound-orc
    vcella ktrig, kreinit, ioutFunc, initStateFunc, \
           iRuleFunc, ielements, irulelen [, iradius]
    ```

### Initialization

_ioutFunc_ - number of the table where the state of each cell is stored

_initStateFunc_  - number of a table containig the inital states of each cell

_iRuleFunc_ - number of a lookup table containing the rules

_ielements_ - total number of cells

_irulelen_  - total number of rules

_iradius_ (optional) - radius of Cellular Automata. At present time CA radius can be 1 or 2 (1 is the default)

### Performance

_ktrig_ - trigger signal. Each time it is non-zero, a new generation of cells is evaluated

_kreinit_ - trigger signal. Each time it is non-zero, state of all cells is forced to be that of _initStateFunc_.

_vcella_ supports unidimensional cellular automata, where the state of each cell is stored in _ioutFunc_. So _ioutFunc_ is a vector containing current state of each cell. This variant vector can be used together with any other vector-based opcode, such as [adsynt](../opcodes/adsynt.md), [vmap](../opcodes/vmap.md), [vpowv](../opcodes/vpowv.md) etc.

_initStateFunc_ is an input vector containing the inital value of the row of cells, while _iRuleFunc_ is an input vector containing the rules in the form of a lookup table. Notice that _initStateFunc_ and _iRuleFunc_ can be updated during the performance by means of other vector-based opcodes (for example [vcopy](../opcodes/vcopy.md)) in order to force to change rules and status at performance time.

A new generation of cells is evaluated each time _ktrig_ contains a non-zero value. Also the status of all cells can be forced to assume the status corresponding to the contents of _initStateFunc_ each time _kreinit_ contains a non-zero value.

Radius of CA algorithm can be 1 or 2 (optional _iradius_ arguement).

## Examples

Here is an example of the vcella opcode. It uses the file [vcella.csd](../examples/vcella.csd).

The following example uses _vcella_

``` csound-orc title="Example of the vcella opcode." linenums="1"
--8<-- "examples/vcella.csd"
```

## See also

[Vectorial:Cellular Automata](../vectorial/vectorial.md)

[Models and Emulations](../siggen/models.md)

## Credits

Written by: Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)

Example by: Anthony Kozar
