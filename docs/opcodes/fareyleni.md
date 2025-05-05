<!--
id:fareyleni
category:Signal Generators:Models and Emulations
-->
# fareyleni
Returns the length of a Farey Sequence.

This opcode can be used in conjunction with [GENfarey](../scoregens/genfarey.md). It calculates the length of Farey Sequence F<sub>n</sub>. Its length is given by: |F<sub>n</sub>| = 1 + SUM over n phi(m) where phi(m) is Euler's totient function, which gives the number of integers &#8804; m that are coprime to m.

Some values for the length of F<sub>n</sub> given n:

| n | F |
|---|---|
| 1 | 2 |
| 2 | 3 |
| 3 | 5 |
| 4 | 7 |
| 5 | 11 |
| 6 | 13 |
| 7 | 19 |
| 8 | 23 |
| 9 | 29 |
| 10 | 33 |
| 11 | 43 |
| 12 | 47 |
| 13 | 59 |
| 14 | 65 |
| 15 | 73 |
| 16 | 81 |
| 17 | 97 |
| 18 | 103 |
| 19 | 121 |
| 20 | 129 |

## Syntax
=== "Modern"
    ``` csound-orc
    ifl = fareyleni(ifn)
    ```

=== "Classic"
    ``` csound-orc
    ifl fareyleni ifn
    ```

Initialisation

The length of the identified Farey sequence is returned.

_ifn_ -- Integer identifying the sequence.

## Examples

Here is an example of the fareyleni opcode. It uses the file [fareyleni.csd](../examples/fareyleni.csd).

``` csound-orc title="Example of the fareyleni opcode." linenums="1"
--8<-- "examples/fareyleni.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Georg Boenn <br>
University of Glamorgan, UK<br>

New in Csound version 5.13
