<!--
id:cell
category:Vectorial:Cellular Automata
-->
# cell
Cellular Automaton.

Plugin opcode in cellular

One-Dimensional Cellular Automaton. This opcode is the modified version of _vcella_ by Gabriel Maldonado.

## Syntax
=== "Modern"
    ``` csound-orc
    cell(ktrig, kreinit, ioutFunc, initStateFunc, iRuleFunc, ielements)
    ```

=== "Classic"
    ``` csound-orc
    cell ktrig, kreinit, ioutFunc, initStateFunc, iRuleFunc, ielements
    ```

### Initialization

_ioutFunc_ -- number of the table where the state of each cell is stored.

_initStateFunc_ -- number of the table containing the inital states of cells.

_iRuleFunc_ -- number of a lookup table containing the 8-bit rule.

_ielements_ -- total number of cells in a row.

### Performance

_ktri_ -- trigger signal. Each time it is non-zero, a new generation of cells is evaluated.

_kreinit_ -- reset signal. Each time it is non-zero, state of all cells is forced to be that of initStateFunc.

_cell_ models a classical 1D cellular automaton and stores the state of each cell in the table identified by _ioutFunc_.

_initStateFunc_ is an input vector containing the inital value of the row of cells, while _iRuleFunc_ is an input vector containing the chosen rule in the binary form (least significant bit first).

A new generation of cells is evaluated each time _ktrig_ contains a non-zero value.  Also the status of all cells can be forced to assume the status corresponding to the contents of _initStateFunc_ each time _kreinit_ contains a non-zero value.

Note that each cell is supposed to be in one of two possible states (1 = "alive", 0 = "dead"), although fractional values should work too, because truncation is used.

## Examples

=== "Modern"
    Here is a simple example of the cell opcode. It uses the file
    [cell-modern.csd](../examples/cell-modern.csd).
    ``` csound-orc title="A simple example of the cell opcode." linenums="1"
    --8<-- "examples/cell-modern.csd"
    ```

=== "Classic"
    Here is a simple example of the cell opcode. It uses the file
    [cell.csd](../examples/cell.csd).
    ``` csound-orc title="A simple example of the cell opcode." linenums="1"
    --8<-- "examples/cell.csd"
    ```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Gleb Rogozinsky<br>
October 2011<br>

New in Csound version 5.16.6
