<!--
id:pvsfromarray
category:Spectral Processing:Streaming
-->
# pvsfromarray
Same as the [tab2pvs](../opcodes/tab2pvs.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsfromarray(karr[] [,ihopsize, iwinsize, iwintype])
    fsig = pvsfromarray(kmags[], kfreqs[] [,ihopsize, iwinsize, iwintype])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsfromarray karr[] [,ihopsize, iwinsize, iwintype]
    fsig pvsfromarray kmags[], kfreqs[] [,ihopsize, iwinsize, iwintype]
    ```
