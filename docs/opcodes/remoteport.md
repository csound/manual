<!--
id:remoteport
category:Network
-->
# remoteport
Defines the port for use with the _insremot_, _midremot_, _insglobal_ and _midglobal_ opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    remoteport(iportnum)
    ```

=== "Classic"
    ``` csound-orc
    remoteport iportnum
    ```

### Initialization

_iportnum_ -- number of the port to be used. If zero or negative the default port 40002 is selected.

## See also

[Remote Opcodes](../oscnetwork/Remote.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
November, 2006<br>

New in Csound version 5.05
