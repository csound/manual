<!--
id:prepiano
category:Signal Generators:Models and Emulations
-->
# prepiano
Creates a tone similar to a piano string prepared in a Cageian fashion.

Audio output is a tone similar to a piano string, prepared with a number of rubbers and rattles. The method uses a physical model developed from solving the partial differential equation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = prepiano(ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \
                    iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers])
    al, ar = prepiano(ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \
                      iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers])
    ```

=== "Classic"
    ``` csound-orc
    ares prepiano ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \
                  iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers]
    al, ar prepiano ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \
                    iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers]
    ```

### Initialization

_ifreq_ -- The base frequency of the string.

_iNS_ -- the number of strings involved.  In a real piano 1, 2 or 3 strings are found in different frequency regions.

_iD_ -- the amount each string other that the first is detuned from the main frequency, measured in cents.

_iK_ -- dimensionless stiffness parameter.

_iT30_ -- 30 db decay time in seconds.

_ib_ -- high-frequency loss parameter (keep this small).

_imass_ -- the mass of the piano hammer.

_ihvfreq_ -- the frequency of the natural vibrations of the hammer.

_iinit_ -- the initial position of the hammer.

_ipos_ -- position along the string that the strike occurs.

_ivel_ -- normalized strike velocity.

_isfreq_ -- scanning frequency of the reading place.

_isspread_ -- scanning frequency spread.

_irattles_ -- table number giving locations of any rattle(s).

_irubbers_ -- table number giving locations of any rubbers(s).

The rattles and rubbers tables are collections of four values, preceeded by a count. In the case of a rattle the four are position, mass density ratio of rattle/string, frequency of rattle and vertical length of the rattle.  For the rubber the fours are position, mass density ratio of rubber/string, frequency of rubber and the loss parameter.

### Performance

A note is played on a piano string, with the arguments as below.

_kbcL_ -- Boundary condition at left end of string (1 is clamped, 2 pivoting and 3 free).

_kbcR_ -- Boundary condition at right end of string (1 is clamped, 2 pivoting and 3 free).

Note that changing the boundary conditions during playing may lead to glitches and is made available as an experiment.

## Examples

Here is an example of the prepiano opcode. It uses the file [prepiano.csd](../examples/prepiano.csd).

``` csound-orc title="Example of the prepiano opcode." linenums="1"
--8<-- "examples/prepiano.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Stefan Bilbao <br>
University of Edinburgh, UK<br>
Author: John ffitch <br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 5.05
