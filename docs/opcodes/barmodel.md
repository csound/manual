<!--
id:barmodel
category:Signal Generators:Models and Emulations
-->
# barmodel
Creates a tone similar to a struck metal bar.

It uses a physical model developed from solving the partial differential equation. There are controls over the boundary conditions as well as the bar characteristics.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = barmodel(kbcL, kbcR, iK, ib, kscan, iT30, ipos, ivel, iwid)
    ```

=== "Classic"
    ``` csound-orc
    ares barmodel kbcL, kbcR, iK, ib, kscan, iT30, ipos, ivel, iwid
    ```

### Initialization

_iK_ -- dimensionless stiffness parameter. If this parameter is negative then the initialisation is skipped and the previous state of the bar is continued.

_ib_ -- high-frequency loss parameter (keep this small).

_iT30_ -- 30 db decay time in seconds.

_ipos_ -- position along the bar that the strike occurs.

_ivel_ -- normalized strike velocity.

_iwid_ -- spatial width of strike.

### Performance

A note is played on a metalic bar, with the arguments as below.

_kbcL_ -- Boundary condition at left end of bar (1 is clamped, 2 pivoting and 3 free).

_kbcR_ -- Boundary condition at right end of bar (1 is clamped, 2 pivoting and 3 free).

_kscan_ -- Speed of scanning the output location.

Note that changing the boundary conditions during playing may lead to glitches and is made available as an experiment.  The use of a non-zero _kscan_ can give apparent re-introduction of sound due to modulation.

## Examples

=== "Modern"
    Here is an example of the barmodel opcode. It uses the file [barmodel-modern.csd](../examples/barmodel-modern.csd).
    ``` csound-orc title="Example of the barmodel opcode." linenums="1"
    --8<-- "examples/barmodel-modern.csd"
    ```

=== "Classic"
    Here is an example of the barmodel opcode. It uses the file [barmodel.csd](../examples/barmodel.csd).
    ``` csound-orc title="Example of the barmodel opcode." linenums="1"
    --8<-- "examples/barmodel.csd"
    ```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Stefan Bilbao <br>
University of Edinburgh, UK<br>
Author: John ffitch <br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 5.01
