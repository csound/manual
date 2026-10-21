<!--
id:stmaddcondedge
category:Instrument Control:State Machine Graphs
-->
# stmaddcondedge

Adds edges from one node to several possible targets.

A conditional edge declares the set of nodes a node may branch to. The node chooses one of them at performance time with [stmnext](stmnext.md), and [stmadvance](stmadvance.md) checks the choice against that set. It is the same as calling [stmaddedge](stmaddedge.md) once for each target.

## Syntax

=== "Modern"
    ``` csound-orc
    stmaddcondedge(ibuilder, Sfrom, Stargets[])
    ```

=== "Classic"
    ``` csound-orc
    stmaddcondedge ibuilder, Sfrom, Stargets[]
    ```

### Initialization

_ibuilder_ -- a builder handle, returned by [stmcreate](stmcreate.md).

_Sfrom_ -- the name of the source node.

_Stargets[]_ -- a string array with the names of the target nodes, for example `["Calm", "Build"]`. The array must be one-dimensional and not empty, otherwise an initialization error is reported. All nodes must already exist, otherwise an initialization error is reported. Targets that are already connected are skipped.

Calling it after [stmcompile](stmcompile.md) has frozen the builder causes an initialization error.

## Examples

A texture moves through three nodes, Calm, Build and Burst. Each node is a UDO that writes a shared struct and asks for the next node with [stmnext](stmnext.md) when its time is up. The runner is created inside the instrument, so it lasts as long as the note. It uses the file [stm.csd](../examples/stm.csd).

``` csound-csd title="A state machine that shapes a texture." linenums="1"
--8<-- "examples/stm.csd"
```

## See also

[State Machine Graphs](../control/stm.md)

[stmaddedge](stmaddedge.md), [stmnext](stmnext.md), [stmadvance](stmadvance.md)

## Credits

Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0<br>
October 2026
