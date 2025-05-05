<!--
id:tabplay
category:Table Control:Read/Write Operations
-->
# tabplay
Plays-back control-rate signals on trigger-temporization basis.

## Syntax
=== "Modern"
    ``` csound-orc
    tabplay(ktrig, knumtics, kfn, kout1 [,kout2,..., koutN])
    ```

=== "Classic"
    ``` csound-orc
    tabplay ktrig, knumtics, kfn, kout1 [,kout2,..., koutN]
    ```

### Performance

_ktrig_ -- starts playing when non-zero.

_knumtics_ -- stop recording or reset playing pointer to zero when the number of tics defined by this argument is reached.

_kfn_ -- table where k-rate signals are recorded.

_kout1,...,koutN_ -- playback output signals.

The _tabplay_ and [tabrec](../opcodes/tabrec.md) opcodes allow to record/playback control signals on trigger-temporization basis.

_tabplay_ plays back a group of k-rate signals, previously recorded by tabrec into a table. Each time ktrig argument is triggered, an internal counter is increased of one unit. After knumtics trigger impluses are received by ktrig argument, the internal counter is zeroed and playback is restarted from the beginning, in looping style.

These opcodes can be used like a  sort of &ldquo;middle-term&rdquo; memory that &ldquo;remembers&rdquo; generated signals. Such memory can be used to supply generative music with a coherent iterative compositional structure.

## Examples

For an examle of use see the example in the [tabrec](../opcodes/tabrec.md)
opcode.

## See also

[Read/Write Operations](../table/readwrit.md)

## Credits

Written by Gabriel Maldonado.
